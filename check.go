package main

import (
	"fmt"

	badger "github.com/dgraph-io/badger/v3"
)

func main1() {
	// Open the Badger database located in the /tmp/badger directory.
	// It will be created if it doesn't exist.
	opts := badger.DefaultOptions("/customer_data/badger2/")
	opts = opts.WithValueThreshold(5000000)
	db, err := badger.Open(opts)
	if err != nil {
		fmt.Println(err)
		return
	}
	defer db.Close()
	err = db.View(func(txn *badger.Txn) error {
		item, err := txn.Get([]byte("user3685060320442494623"))
		if err != nil {
			return err
		}
		var dst []byte
		row, err := item.ValueCopy(dst)
		if err != nil {
			return err
		}
		fmt.Println("Found the value ", len(row))
		fmt.Println(string(row))
		return err
	})

	// Your code here…
}
