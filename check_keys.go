package main

import (
	"bytes"
	"fmt"
	"sync"

	badger "github.com/dgraph-io/badger/v3"
)

func main() {

	opts := badger.DefaultOptions("/tmp/badger/")
	db, err := badger.Open(opts)
	if err != nil {
		fmt.Println(err)
		return
	}
	defer db.Close()

	opts1 := badger.DefaultOptions("/tmp/badger2/")
	db1, err1 := badger.Open(opts1)
	if err1 != nil {
		fmt.Println(err1)
		return
	}
	defer db1.Close()

	var wg sync.WaitGroup
	for i := 0; i < 256; i++ {
		go func(i int) {
			wg.Add(1)
			defer wg.Done()
			compareKeysWithPrefix(i, []byte(string(i)), db, db1)
		}(i)
	}

	wg.Wait()
}

func compareKeysWithPrefix(id int, keyPrefix []byte, db *badger.DB, db1 *badger.DB) {
	// Open the Badger database located in the /tmp/badger directory.
	// It will be created if it doesn't exist.

	txn := db.NewTransaction(false)
	defer txn.Discard()

	itr := txn.NewIterator(badger.DefaultIteratorOptions)
	defer itr.Close()

	count := 0
	for itr.Seek(keyPrefix); itr.ValidForPrefix(keyPrefix); itr.Next() {
		item := itr.Item()
		err := db1.View(func(txn *badger.Txn) error {
			val, err := txn.Get(item.Key())
			if err != nil {
				return err
			}
			var dst1, dst2 []byte
			val1, _ := val.ValueCopy(dst1)
			val2, _ := item.ValueCopy(dst2)
			if bytes.Compare(val1, val2) != 0 {
				fmt.Println("******** Couldnt match value for this key : ************", string(item.Key()))
			}
			return nil
		})
		if err != nil {
			fmt.Println("******** Couldnt find this key : ************", string(item.Key()))
		}
		count += 1
		if count%5000 == 0 {
			fmt.Println("Prefix ", id, " completed : ", count)
		}
	}
	fmt.Println("Prefix  ", id, " finished : ", count)
}
