package pebble

import (
	"context"
	"database/sql"
	"fmt"
	"os"

	"github.com/cockroachdb/pebble"
	"github.com/cockroachdb/pebble/bloom"
	"github.com/magiconair/properties"
	"github.com/pingcap/go-ycsb/pkg/prop"
	"github.com/pingcap/go-ycsb/pkg/util"
	"github.com/pingcap/go-ycsb/pkg/ycsb"
)

// properties
const (
	pebblePath                        = "pebble.dir"
	pebbleCacheSize                   = "pebble.cache_size"
	pebbleConcurrency                 = "pebble.concurrency"
	pebbleDisableWAL                  = "pebble.disable_WAL"
	pebbleComparer                    = "pebble.comparer"
	pebbleFormatMajorVersion          = "pebble.format_major_version"
	pebbleL0CompactionThreshold       = "pebble.L0_compaction_threshold"
	pebbleL0StopWritesThreshold       = "pebble.L0_stop_writes_threshold"
	pebbleLBaseMaxBytes               = "pebble.l_base_max_bytes"
	pebbleLevels                      = "pebble.levels"
	pebbleMaxConcurrentCompactions    = "pebble.max_concurrent_compactions"
	pebbleMaxOpenFiles                = "pebble.max_open_files"
	pebbleMemTableSize                = "pebble.mem_table_size"
	pebbleMemTableStopWritesThreshold = "pebble.mem_table_stop_writes_threshold"
	//concurrency?
)

type pebbleCreator struct {
}

type pebbleOptions struct {
	Path string
	//FileMode  os.FileMode
	DBOptions *pebble.Options
}

type pebbleDB struct {
	p *properties.Properties

	db *pebble.DB

	r       *util.RowCodec
	bufPool *util.BufPool
}

type contextKey string

const stateKey = contextKey("pebble")

type pebbleState struct {
}

func (c pebbleCreator) Create(p *properties.Properties) (ycsb.DB, error) {

	opts := getOptions(p)

	if p.GetBool(prop.DropData, prop.DropDataDefault) {
		os.RemoveAll(pebblePath)
	}

	//Akon nopts := &pebble.Options{FS: vfs.Default}
	//Akon db, err := pebble.Open(path, nopts)
	db, err := pebble.Open(opts.Path, opts.DBOptions)

	opts.DBOptions.Cache.Unref()

	if err != nil {
		return nil, err
	}
	return &pebbleDB{
		p:       p,
		db:      db,
		r:       util.NewRowCodec(p),
		bufPool: util.NewBufPool(),
	}, nil
}

func getOptions(p *properties.Properties) pebbleOptions {
	path := p.GetString(pebblePath, "/tmp/pebble")

	cacheSize := p.GetInt64(pebbleCacheSize, 1<<30)
	//cacheSize := int64(1 << 30)
	cache := pebble.NewCache(cacheSize)
	//defer cache.Unref()

	opts := &pebble.Options{
		Cache:                       cache,
		DisableWAL:                  p.GetBool(pebbleDisableWAL, false),
		FormatMajorVersion:          pebble.FormatNewest,
		L0CompactionThreshold:       p.GetInt(pebbleL0CompactionThreshold, 2),
		L0StopWritesThreshold:       p.GetInt(pebbleL0StopWritesThreshold, 1000),
		LBaseMaxBytes:               p.GetInt64(pebbleLBaseMaxBytes, 64<<20), // 64 MB
		Levels:                      make([]pebble.LevelOptions, 7),
		MaxConcurrentCompactions:    p.GetInt(pebbleMaxConcurrentCompactions, 3),
		MaxOpenFiles:                p.GetInt(pebbleMaxOpenFiles, 16384),
		MemTableSize:                p.GetInt(pebbleMemTableSize, 64<<20),
		MemTableStopWritesThreshold: p.GetInt(pebbleMemTableStopWritesThreshold, 4),
		Merger: &pebble.Merger{
			Name: "cockroach_merge_operator",
		},
	}

	for i := 0; i < len(opts.Levels); i++ {
		l := &opts.Levels[i]
		l.BlockSize = 32 << 10       // 32 KB
		l.IndexBlockSize = 256 << 10 // 256 KB
		l.FilterPolicy = bloom.FilterPolicy(10)
		l.FilterType = pebble.TableFilter
		if i > 0 {
			l.TargetFileSize = opts.Levels[i-1].TargetFileSize * 2
		}
		l.EnsureDefaults()
	}
	opts.Levels[6].FilterPolicy = nil
	opts.FlushSplitBytes = opts.Levels[0].TargetFileSize

	opts.EnsureDefaults()

	return pebbleOptions{
		Path:      path,
		DBOptions: opts,
	}

}

func (db *pebbleDB) Close() error {
	db.db.Flush()
	return db.db.Close()
}

func (db *pebbleDB) ToSqlDB() *sql.DB {
	return nil
}

func (db *pebbleDB) InitThread(ctx context.Context, _ int, _ int) context.Context {
	return ctx
}

func (db *pebbleDB) CleanupThread(_ context.Context) {
}

func (db *pebbleDB) getRowKey(table string, key string) []byte {
	return util.Slice(fmt.Sprintf("%s:%s", table, key))
}

func (db *pebbleDB) Read(ctx context.Context, table string, key string, fields []string) (map[string][]byte, error) {
	var m map[string][]byte
	rowKey := db.getRowKey(table, key)

	val, closer, err := db.db.Get(rowKey)
	if err != nil {
		return nil, err
	}

	if closer != nil {
		closer.Close()
	}

	m, err = db.r.Decode(val, fields)
	return m, err

}

// <key>\x00[<wall_time>[<logical>]]<#timestamp-bytes>
func mvccEncode(dst, key []byte, walltime uint64, logical uint32) []byte {
	dst = append(dst, key...)
	dst = append(dst, 0)
	/*if walltime != 0 || logical != 0 {
		extra := byte(1 + 8)
		dst = encodeUint64Ascending(dst, walltime)
		if logical != 0 {
			dst = encodeUint32Ascending(dst, logical)
			extra += 4
		}
		dst = append(dst, extra)
	}*/
	return dst
}

func (db *pebbleDB) Scan(ctx context.Context, table string, startKey string, count int, fields []string) ([]map[string][]byte, error) {
	res := make([]map[string][]byte, count)
	rowStartKey := db.getRowKey(table, startKey)

	it := db.db.NewIter(&pebble.IterOptions{
		LowerBound: mvccEncode(nil, rowStartKey, 0, 0),
		//UpperBound: mvccEncode(nil, end, 0, 0),
	})
	defer it.Close()

	i := 0
	for it.SeekGE(rowStartKey); it.Valid() && i < count; it.Next() {

		value := it.Value()
		//is it necessary to copy value?
		m, err := db.r.Decode(value, fields)
		if err != nil {
			return nil, err
		}

		res[i] = m
		i++
	}

	return res, nil
}

func (db *pebbleDB) Update(ctx context.Context, table string, key string, values map[string][]byte) error {

	rowKey := db.getRowKey(table, key)

	val, closer, err := db.db.Get(rowKey)
	if err != nil {
		return err
	}

	/*
		if closer != nil {
			closer.Close()
		}
	*/

	data, err := db.r.Decode(val, nil)
	if err != nil {
		return err
	}

	for field, value := range values {
		data[field] = value
	}

	buf := db.bufPool.Get()
	defer func() {
		db.bufPool.Put(buf)
	}()

	buf, err = db.r.Encode(buf, data)
	if err != nil {
		return err
	}

	err = db.db.Set(rowKey, buf, pebble.NoSync)
	closer.Close()
	return err

}

func (db *pebbleDB) Insert(ctx context.Context, table string, key string, values map[string][]byte) error {
	rowKey := db.getRowKey(table, key)

	buf := db.bufPool.Get()
	defer func() {
		db.bufPool.Put(buf)
	}()

	buf, err := db.r.Encode(buf, values)
	if err != nil {
		return err
	}

	return db.db.Set(rowKey, buf, pebble.NoSync)
}

func (db *pebbleDB) Delete(ctx context.Context, table string, key string) error {

	rowKey := db.getRowKey(table, key)
	return db.db.Delete(rowKey, pebble.NoSync)
}

func init() {
	ycsb.RegisterDBCreator("pebble", pebbleCreator{})
}
