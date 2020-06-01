package utils

import (
	"net/http"
	"fmt"
)

type dollars float32
type Database map[string]dollars

func (db Database) List(w http.ResponseWriter, req *http.Request) {
	for item, data := range db {
		fmt.Fprintf(w, "%s: %g\n", item, data)
	}
}

func (db Database) Price (w http.ResponseWriter, req *http.Request) {
	item := req.URL.Query().Get("item")
	price, ok := db[item]

	if !ok {
		w.WriteHeader(http.StatusNotFound)
		fmt.Fprintf(w, "Item not found")
		return
	}
	fmt.Fprintf(w, "price %g\n", price)
}