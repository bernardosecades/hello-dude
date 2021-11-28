package main

import (
	"fmt"
	"log"
	"net/http"
	"time"
)

func main() {
	host := ":8080"
	http.HandleFunc("/hello", handler)

	fmt.Println("Server running", host)
	log.Fatal(http.ListenAndServe(host, nil))
}

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "[%s] Hello dude!!\n", time.Now().String())
}
