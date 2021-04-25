package main

import (
	_ "cloud.google.com/go/errorreporting"
	"cloud.google.com/go/logging"
	"github.com/gorilla/mux"
	"log"
	"net/http"
)

func main() {
	di := DI{}

	cl, err := di.Logger("casino_api", logging.Critical)
	if err != nil {
		log.Fatal(err)
	}
	il, err := di.Logger("casino_api", logging.Info)
	if err != nil {
		cl.Fatal(err)
	}

	r := mux.NewRouter()

	ctrl, err := di.Controller()
	if err != nil {
		cl.Fatal(err)
	}
	ctrl.RegisterOn(r)
	env := di.Env()
	il.Println("Listening on :" + env.port)
	cl.Fatal(http.ListenAndServe(":"+env.port, r))
}
