package main

import (
	_ "embed"
	"fmt"
	"log"
	"net/http"
)

//go:embed index.html
var html string

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		r.Header.Set("Content-Type", "text/html; charset=utf-8")
		fmt.Fprint(w, html)
		ua := r.Header.Get("User-Agent")
		log.Printf("%s %s\n", r.RemoteAddr, ua)
	})
	http.HandleFunc("/healthz", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintln(w, "ok")
	})
	http.ListenAndServe(":8080", nil)
}
