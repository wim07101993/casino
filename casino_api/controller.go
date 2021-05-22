package main

import (
	"cloud.google.com/go/logging"
	"encoding/json"
	"github.com/gorilla/mux"
	"log"
	"net/http"
	"strconv"
)

const idParam = "id"
const nameParam = "name"
const countParam = "count"

type Controller struct {
	db CasinoDb
	lc *logging.Client
}

func NewController(db CasinoDb, lc *logging.Client) *Controller {
	return &Controller{
		db: db,
		lc: lc,
	}
}

func (c *Controller) RegisterOn(r *mux.Router) {
	r.HandleFunc("/db/slot-machines", c.AddSlotMachine).Methods("POST")
	r.HandleFunc("/db/slot-machines", c.ListSlotMachines).Methods("GET")
	r.HandleFunc("/db/slot-machines/by-name/{"+nameParam+"}", c.GetByName).Methods("GET")
	r.HandleFunc("/db/slot-machines/{"+idParam+"}/tokens", c.GetTokenCount).Methods("GET")
	r.HandleFunc("/db/slot-machines/{"+idParam+"}/tokens", c.SetTokenCount).Methods("PUT")
	r.HandleFunc("/db/slot-machines/{"+idParam+"}/name", c.SetName).Methods("PUT")
	r.HandleFunc("/db/slot-machines/{"+idParam+"}", c.RemoveSlotMachine).Methods("DELETE")
}

func (c *Controller) AddSlotMachine(w http.ResponseWriter, r *http.Request) {
	m := &SlotMachine{}
	err := json.NewDecoder(r.Body).Decode(m)
	if c.writeBadRequestError(w, err, "invalid json") {
		return
	}
	if m.Name == "" {
		_, _ = w.Write([]byte("Please provide a name."))
		w.WriteHeader(http.StatusBadRequest)
		return
	}
	if m.Tokens < 0 {
		_, _ = w.Write([]byte("Please provide a token count greater or equal to 0."))
		w.WriteHeader(http.StatusBadRequest)
		return
	}
	c.logger(logging.Info).Printf("Request: add slot-machine with name: %s", m.Name)
	id, err := c.db.AddSlotMachine(r.Context(), m)
	if c.writeError(w, err) {
		return
	}
	w.WriteHeader(http.StatusCreated)
	_, _ = w.Write([]byte(id))
}

func (c *Controller) ListSlotMachines(w http.ResponseWriter, r *http.Request) {
	c.logger(logging.Info).Println("Request: get all slot-machines")
	ms, err := c.db.ListSlotMachines(r.Context())
	if c.writeError(w, err) {
		return
	}
	bs, err := json.Marshal(ms)
	if c.writeError(w, err) {
		return
	}
	_, _ = w.Write(bs)
}

func (c *Controller) GetByName(w http.ResponseWriter, r *http.Request) {
	name := mux.Vars(r)[nameParam]
	c.logger(logging.Info).Printf("Request: get name of item with name %s", name)
	m, err := c.db.GetByName(r.Context(), name)
	if c.writeError(w, err) {
		return
	}
	bs, err := json.Marshal(m)
	if c.writeError(w, err) {
		return
	}
	_, _ = w.Write(bs)
}

func (c *Controller) GetTokenCount(w http.ResponseWriter, r *http.Request) {
	id := mux.Vars(r)[idParam]
	c.logger(logging.Info).Printf("Request: get token count of %s", id)
	amount, err := c.db.GetTokenCount(r.Context(), id)
	if c.writeError(w, err) {
		return
	}
	_, _ = w.Write([]byte(strconv.Itoa(amount)))
}

func (c *Controller) SetTokenCount(w http.ResponseWriter, r *http.Request) {
	id := mux.Vars(r)[idParam]
	amount, err := strconv.Atoi(r.URL.Query().Get(countParam))
	if c.writeBadRequestError(w, err, "Please provide an amount to set the token count to.") {
		return
	}
	if amount < 0 {
		_, _ = w.Write([]byte("Please provide an amount which is greater or equal to 0."))
		w.WriteHeader(http.StatusBadRequest)
		return
	}
	c.logger(logging.Info).Printf("Request: set token count of %s to %d", id, amount)
	err = c.db.SetTokenCount(r.Context(), id, amount)
	c.writeError(w, err)
}

func (c *Controller) SetName(w http.ResponseWriter, r *http.Request) {
	id := mux.Vars(r)[idParam]
	name := r.URL.Query().Get(nameParam)
	if name == "" {
		_, _ = w.Write([]byte("Please provide a name to set."))
		w.WriteHeader(http.StatusBadRequest)
		return
	}
	c.logger(logging.Info).Printf("Request: set name of %s to %s", id, name)
	err := c.db.SetName(r.Context(), id, name)
	c.writeError(w, err)
}

func (c *Controller) RemoveSlotMachine(w http.ResponseWriter, r *http.Request) {
	id := mux.Vars(r)[idParam]
	c.logger(logging.Info).Printf("Request: delete slot-machine with id %s", id)
	err := c.db.DeleteSlotMachine(r.Context(), id)
	c.writeError(w, err)
}

func (c *Controller) writeError(w http.ResponseWriter, err error) bool {
	if err == nil {
		return false
	}
	message := err.Error()
	c.logger(logging.Error).Println(message)
	switch err.(type) {
	case NameNotFound, IdNotFoundError:
		w.WriteHeader(http.StatusNotFound)
	default:
		w.WriteHeader(http.StatusInternalServerError)
	}
	if message != "" {
		_, _ = w.Write([]byte(message))
	}
	return true
}

func (c *Controller) writeBadRequestError(w http.ResponseWriter, err error, message string) bool {
	if err == nil {
		return false
	}
	w.WriteHeader(http.StatusBadRequest)
	if message != "" {
		_, _ = w.Write([]byte(message))
	}
	return true
}

func (c *Controller) logger(s logging.Severity) *log.Logger {
	return c.lc.Logger("controller").StandardLogger(s)
}
