package main

import (
	_ "cloud.google.com/go/errorreporting"
	"cloud.google.com/go/logging"
	"github.com/gorilla/mux"
	"log"
	"net/http"
)

func main() {
	i := Instantiator{}

	cl, err := i.Logger("casino_api", logging.Critical)
	if err != nil {
		log.Fatal(err)
	}
	il, err := i.Logger("casino_api", logging.Info)
	if err != nil {
		cl.Fatal(err)
	}

	r := mux.NewRouter()

	ctrl, err := i.Controller()
	if err != nil {
		cl.Fatal(err)
	}
	ctrl.RegisterOn(r)
	env := i.Env()
	il.Println("Listening on :" + env.port)
	cl.Fatal(http.ListenAndServe(":"+env.port, r))
}
