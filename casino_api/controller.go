package main

import (
	"encoding/json"
	"github.com/gorilla/mux"
	"net/http"
	"strconv"
)

const idParam = "id"
const countParam = "count"

type Controller struct {
	casino *Casino
	key    string
}

func NewController(casino *Casino, key string) *Controller {
	return &Controller{
		casino: casino,
		key:    key,
	}
}

func (c *Controller) RegisterOn(r *mux.Router) {
	r.HandleFunc("/casino/slot-machines", c.auth(c.AddSlotMachine)).Methods("POST")
	r.HandleFunc("/casino/slot-machines", c.auth(c.ListSlotMachines)).Methods("GET")
	r.HandleFunc("/casino/slot-machines/:"+idParam+"/tokens", c.auth(c.GetTokenCount)).Methods("GET")
	r.HandleFunc("/casino/slot-machines/:"+idParam+"/tokens", c.auth(c.SetTokenCount)).Methods("PUT")
	r.HandleFunc("/casino/slot-machines/:"+idParam, c.auth(c.RemoveSlotMachine)).Methods("DELETE")
}

func (c *Controller) AddSlotMachine(w http.ResponseWriter, r *http.Request) {
	m := &SlotMachine{}
	err := json.NewDecoder(r.Body).Decode(m)
	if writeError(w, err) {
		return
	}
	id, err := c.casino.DB.AddSlotMachine(r.Context(), m)
	if writeError(w, err) {
		return
	}
	w.WriteHeader(http.StatusCreated)
	_, _ = w.Write([]byte(id))
}

func (c *Controller) ListSlotMachines(w http.ResponseWriter, r *http.Request) {
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
	ps := mux.Vars(r)
	amount, err := c.casino.DB.GetTokenCount(r.Context(), ps[idParam])
	if writeError(w, err) {
		return
	}
	_, _ = w.Write([]byte(strconv.Itoa(amount)))
}

func (c *Controller) SetTokenCount(w http.ResponseWriter, r *http.Request) {
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
	ps := mux.Vars(r)
	err = c.casino.DB.SetTokenCount(r.Context(), ps[idParam], amount)
	writeError(w, err)
}

func (c *Controller) RemoveSlotMachine(w http.ResponseWriter, r *http.Request) {
	ps := mux.Vars(r)
	err := c.casino.DB.DeleteSlotMachine(r.Context(), ps[idParam])
	writeError(w, err)
}

func (c *Controller) auth(f func(w http.ResponseWriter, r *http.Request)) func(w http.ResponseWriter, r *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {
		if r.Header.Get("x-api-key") == c.key {
			f(w, r)
		} else {
			w.WriteHeader(http.StatusNotFound)
		}
	}
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
