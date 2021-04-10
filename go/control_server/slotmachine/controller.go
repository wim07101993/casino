package slotmachine

import (
	"encoding/json"
	"net/http"
	"strconv"
)
import "github.com/julienschmidt/httprouter"

const idParam = "id"
const amountParam = "amount"

type Controller struct {
	machines *Machines
	key      string
}

func NewController(ms *Machines, key string) *Controller {
	return &Controller{
		machines: ms,
		key:      key,
	}
}

func (c *Controller) RegisterOn(r *httprouter.Router) {
	r.POST("/", c.auth(c.AddSlotMachine))
	r.GET("/all", c.auth(c.ListSlotMachines))
	r.GET("/:"+idParam+"/amount", c.auth(c.GetAmount))
	r.PUT("/:"+idParam+"/add-token", c.auth(c.AddTokens))
	r.PUT("/:"+idParam+"/remove-tokens", c.auth(c.RemoveTokens))
	r.DELETE("/:"+idParam, c.auth(c.RemoveSlotMachine))
}

func (c *Controller) ListSlotMachines(w http.ResponseWriter, _ *http.Request, _ httprouter.Params) {
	ms := c.machines.Machines()
	bs, err := json.Marshal(ms)
	if err != nil {
		_, err = w.Write(bs)
	}
	if writeError(w, err) {
		return
	}
	w.WriteHeader(http.StatusOK)
}

func (c *Controller) GetAmount(w http.ResponseWriter, _ *http.Request, ps httprouter.Params) {
	amount, err := c.machines.Amount(ps.ByName(idParam))
	if err == nil {
		_, err = w.Write([]byte(strconv.Itoa(amount)))
	}
	writeError(w, err)
}

func (c *Controller) AddSlotMachine(w http.ResponseWriter, _ *http.Request, _ httprouter.Params) {
	id  := c.machines.AddSlotMachine()
	_, err := w.Write([]byte(id))
	if writeError(w, err) {
		return
	}
	w.WriteHeader(http.StatusCreated)
}

func (c *Controller) RemoveSlotMachine(w http.ResponseWriter, _ *http.Request, ps httprouter.Params) {
	err := c.machines.RemoveSlotMachine(ps.ByName(idParam))
	if writeError(w, err) {
		return
	}
	w.WriteHeader(http.StatusOK)
}

func (c *Controller) AddTokens(w http.ResponseWriter, r *http.Request, ps httprouter.Params) {
	amount, _ := strconv.Atoi(r.URL.Query().Get(amountParam))
	if amount == 0 {
		amount = 1
	}
	err := c.machines.AddTokens(ps.ByName(idParam), amount)
	if writeError(w, err) {
		return
	}
	w.WriteHeader(http.StatusOK)
}

func (c *Controller) RemoveTokens(w http.ResponseWriter, r *http.Request, ps httprouter.Params) {
	amount, _ := strconv.Atoi(r.URL.Query().Get(amountParam))
	if amount == 0 {
		amount = 1
	}
	err := c.machines.RemoveTokens(ps.ByName(idParam), amount)
	if writeError(w, err) {
		return
	}
	w.WriteHeader(http.StatusOK)
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
	case NotFoundError:
		w.WriteHeader(http.StatusNotFound)
	case AlreadyRegisteredError:
		w.WriteHeader(http.StatusConflict)
	default:
		w.WriteHeader(http.StatusInternalServerError)
	}
	return true
}
