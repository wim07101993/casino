package main

import (
	"control_server/slotmachine"
	"github.com/julienschmidt/httprouter"
	"log"
	"net/http"
)

func main() {
	repo := slotmachine.NewRepository()
	router := httprouter.New()
	ctrl := slotmachine.NewController(repo)
	ctrl.RegisterOn(router)
	log.Fatal(http.ListenAndServe(":5000", router))
}
