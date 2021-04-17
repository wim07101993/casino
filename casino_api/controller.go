package main

import (
	"encoding/json"
	"github.com/gorilla/mux"
	"log"
	"net/http"
	"strconv"
)

const idParam = "id"
const countParam = "count"

type Controller struct {
	casino *Casino
	logger *log.Logger
}

func NewController(casino *Casino, logger *log.Logger) *Controller {
	return &Controller{
		casino: casino,
		logger: logger,
	}
}

func (c *Controller) RegisterOn(r *mux.Router) {
	r.HandleFunc("/casino/slot-machines", c.AddSlotMachine).Methods("POST")
	r.HandleFunc("/casino/slot-machines", c.ListSlotMachines).Methods("GET")
	r.HandleFunc("/casino/slot-machines/{"+idParam+"}/tokens", c.GetTokenCount).Methods("GET")
	r.HandleFunc("/casino/slot-machines/{"+idParam+"}/tokens", c.SetTokenCount).Methods("PUT")
	r.HandleFunc("/casino/slot-machines/{"+idParam+"}", c.RemoveSlotMachine).Methods("DELETE")
}

func (c *Controller) AddSlotMachine(w http.ResponseWriter, r *http.Request) {
	m := &SlotMachine{}
	err := json.NewDecoder(r.Body).Decode(m)
	if writeError(w, err) {
		return
	}
	c.logger.Printf("Request: add slot-machine with name: %s", m.Name)
	id, err := c.casino.DB.AddSlotMachine(r.Context(), m)
	if writeError(w, err) {
		return
	}
	w.WriteHeader(http.StatusCreated)
	_, _ = w.Write([]byte(id))
}

func (c *Controller) ListSlotMachines(w http.ResponseWriter, r *http.Request) {
	c.logger.Println("Request: get all slot-machines")
	ms, err := c.casino.DB.ListSlotMachines(r.Context())
	if writeError(w, err) {
		return
	}
	bs, err := json.Marshal(ms)
	if writeError(w, err) {
		return
	}
	_, _ = w.Write(bs)
}

func (c *Controller) GetTokenCount(w http.ResponseWriter, r *http.Request) {
	id := mux.Vars(r)[idParam]
	c.logger.Printf("Request: get token count of %s", id)
	amount, err := c.casino.DB.GetTokenCount(r.Context(), id)
	if writeError(w, err) {
		return
	}
	_, _ = w.Write([]byte(strconv.Itoa(amount)))
}

func (c *Controller) SetTokenCount(w http.ResponseWriter, r *http.Request) {
	id := mux.Vars(r)[idParam]
	amount, err := strconv.Atoi(r.URL.Query().Get(countParam))
	if err != nil {
		_, _ = w.Write([]byte("Please provide an amount to set the token count to."))
		w.WriteHeader(http.StatusBadRequest)
		return
	}
	if amount < 0 {
		_, _ = w.Write([]byte("Please provide an amount which is greater or equal to 0."))
		w.WriteHeader(http.StatusBadRequest)
		return
	}
	c.logger.Printf("Request: set token count of %s to %d", id, amount)
	err = c.casino.DB.SetTokenCount(r.Context(), id, amount)
	writeError(w, err)
}

func (c *Controller) RemoveSlotMachine(w http.ResponseWriter, r *http.Request) {
	id := mux.Vars(r)[idParam]
	c.logger.Printf("Request: delete slot-machine with id %s", id)
	err := c.casino.DB.DeleteSlotMachine(r.Context(), id)
	writeError(w, err)
}

func writeError(w http.ResponseWriter, err error) bool {
	if err == nil {
		return false
	}
	errMessage := err.Error()
	switch errMessage {
	default:
		w.WriteHeader(http.StatusInternalServerError)
	}
	return true
}
