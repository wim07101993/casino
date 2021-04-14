package main

import (
	"encoding/json"
	"net/http"
	"strconv"
)
import "github.com/julienschmidt/httprouter"

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

func (c *Controller) RegisterOn(r *httprouter.Router) {
	r.POST("/casino/slot-machines/", c.auth(c.AddSlotMachine))
	r.GET("/casino/slot-machines/", c.auth(c.ListSlotMachines))
	r.GET("/casino/slot-machines/:"+idParam+"/tokens", c.auth(c.GetTokenCount))
	r.PUT("/casino/slot-machines/:"+idParam+"/tokens", c.auth(c.SetTokenCount))
	r.DELETE("/casino/slot-machines/:"+idParam, c.auth(c.RemoveSlotMachine))
}

func (c *Controller) AddSlotMachine(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
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

func (c *Controller) ListSlotMachines(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
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

func (c *Controller) GetTokenCount(w http.ResponseWriter, r *http.Request, ps httprouter.Params) {
	amount, err := c.casino.DB.GetTokenCount(r.Context(), ps.ByName(idParam))
	if writeError(w, err) {
		return
	}
	_, _ = w.Write([]byte(strconv.Itoa(amount)))
}

func (c *Controller) SetTokenCount(w http.ResponseWriter, r *http.Request, ps httprouter.Params) {
	amount, err := strconv.Atoi(r.URL.Query().Get(countParam))
	if err != nil{
		_, _ = w.Write([]byte("Please provide an amount to set the token count to."))
		w.WriteHeader(http.StatusBadRequest)
		return
	}
	if amount < 0 {
		_, _ = w.Write([]byte("Please provide an amount which is greater or equal to 0."))
		w.WriteHeader(http.StatusBadRequest)
		return
	}
	err = c.casino.DB.SetTokenCount(r.Context(), ps.ByName(idParam), amount)
	writeError(w, err)
}

func (c *Controller) RemoveSlotMachine(w http.ResponseWriter, r *http.Request, ps httprouter.Params) {
	err := c.casino.DB.DeleteSlotMachine(r.Context(), ps.ByName(idParam))
	writeError(w, err)
}

func (c *Controller) auth(h httprouter.Handle) httprouter.Handle {
	return func(w http.ResponseWriter, r *http.Request, ps httprouter.Params) {
		if r.Header.Get("x-api-key") == c.key {
			h(w, r, ps)
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
