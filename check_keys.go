package main

import (
	"fmt"

	badger "github.com/dgraph-io/badger/v3"
)

func main() {
	// Open the Badger database located in the /tmp/badger directory.
	// It will be created if it doesn't exist.
	opts := badger.DefaultOptions("/customer_data/badger2/")
	db, err := badger.Open(opts)
	if err != nil {
		fmt.Println(err)
		return
	}
	defer db.Close()

	txn := db.NewTransaction(false)
	defer txn.Discard()

	itr := txn.NewIterator(badger.DefaultIteratorOptions)
	defer itr.Close()

	// Collect keys from flattened directory
	var StringSet map[string]int
	keyPrefix := []byte("")
	for itr.Seek(keyPrefix); itr.ValidForPrefix(keyPrefix); itr.Next() {
		item := itr.Item()
		StringSet[string(item.Key())] = 0
	}

	//go through non-flattened directory
	opts1 := badger.DefaultOptions("/customer_data/badger/")
	db1, err1 := badger.Open(opts1)
	if err1 != nil {
		fmt.Println(err1)
		return
	}
	defer db1.Close()

	txn1 := db1.NewTransaction(false)
	defer txn1.Discard()

	itr1 := txn1.NewIterator(badger.DefaultIteratorOptions)
	defer itr1.Close()

	for itr.Seek(keyPrefix); itr.ValidForPrefix(keyPrefix); itr.Next() {
		item := itr.Item()
		tmp := string(item.Key())
		if _, ok := StringSet[tmp]; ok {
			//do something here
		} else {
			fmt.Println("Failed for this key ", tmp)
		}
	}
}
