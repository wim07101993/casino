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
	r.GET("/", func(w http.ResponseWriter, _ *http.Request, _ httprouter.Params) {
		_, err := w.Write([]byte("Welcome on the slot-machine control server"))
		if err != nil {
			w.WriteHeader(http.StatusInternalServerError)
		} else {
			w.WriteHeader(http.StatusOK)
		}
	})

	ctrl := slotmachine.NewController(ms, key)
	ctrl.RegisterOn(r)

	log.Println("Listening on :5000")
	log.Fatal(http.ListenAndServe(":5000", r))
}
