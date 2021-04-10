package main

import (
	"control_server/slotmachine"
	"flag"
	"github.com/julienschmidt/httprouter"
	"log"
	"net/http"
)

func main() {
	var key string
	flag.StringVar(&key, "k", "key", "The key which must be given with each request.")
	flag.Parse()

	ms := slotmachine.NewMachines()
	r := httprouter.New()

	ctrl := slotmachine.NewController(ms, key)
	ctrl.RegisterOn(r)

	log.Println("Listening on :5000")
	log.Fatal(http.ListenAndServe(":5000", r))
}
