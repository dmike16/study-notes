package main

import (
	"com.github/dmike16/study-notes/interface/utils"
	"fmt"
	"net/http"
	"sort"
//	"log"
)

func main() {
	var c utils.ByteCounter
	c.Write([]byte("Hello"))
	fmt.Println(c)

	var names = []string{"pippo", "pluto", "papaerino"}
	sort.Sort(utils.StringSlice(names))
	fmt.Println(names)

	fmt.Println(sort.IsSorted(utils.StringSlice(names)))

	var db = utils.Database{"shoes": 100, "socks": 5}
	mux := http.NewServeMux()
	mux.Handle("/list", http.HandlerFunc(db.List))
	mux.Handle("/price", http.HandlerFunc(db.Price))

	// log.Fatal(http.ListenAndServe("localhost:8080", mux))
}
