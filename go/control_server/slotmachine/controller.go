package slotmachine

import (
	"net/http"
	"strconv"
)
import "github.com/julienschmidt/httprouter"

const idParam = "id"
const amountParam = "amount"

type Controller struct {
	repository *Repository
}

func NewController(r *Repository) *Controller {
	return &Controller{
		r,
	}
}

func (c *Controller) AddSlotMachine(w http.ResponseWriter, _ *http.Request, ps httprouter.Params) {
	err := c.repository.AddSlotMachine(ps.ByName(idParam))
	if err == nil {
		w.WriteHeader(http.StatusCreated)
		return
	}
	errMessage := err.Error()
	switch errMessage {
	case AlreadyRegisteredError:
		w.WriteHeader(http.StatusConflict)
	}
}

func (c *Controller) RemoveSlotMachine(w http.ResponseWriter, _ *http.Request, ps httprouter.Params) {
	err := c.repository.RemoveSlotMachine(ps.ByName(idParam))
	if err == nil {
		w.WriteHeader(http.StatusCreated)
		return
	}
	errMessage := err.Error()
	switch errMessage {
	case NotFoundError:
		w.WriteHeader(http.StatusNotFound)
	}
}

func (c *Controller) AddTokens(w http.ResponseWriter, r *http.Request, ps httprouter.Params) {
	amount, _ := strconv.Atoi(r.URL.Query().Get(amountParam))
	if amount == 0 {
		amount = 1
	}
	err := c.repository.AddTokens(ps.ByName(idParam), amount)
	if err == nil {
		w.WriteHeader(http.StatusCreated)
		return
	}
	errMessage := err.Error()
	switch errMessage {
	case NotFoundError:
		w.WriteHeader(http.StatusNotFound)
	}
}

func (c *Controller) RemoveTokens(w http.ResponseWriter, r *http.Request, ps httprouter.Params) {
	amount, _ := strconv.Atoi(r.URL.Query().Get(amountParam))
	if amount == 0 {
		amount = 1
	}
	err := c.repository.RemoveTokens(ps.ByName(idParam), amount)
	if err == nil {
		w.WriteHeader(http.StatusCreated)
		return
	}
	errMessage := err.Error()
	switch errMessage {
	case NotFoundError:
		w.WriteHeader(http.StatusNotFound)
	}
}

func (c *Controller) RegisterOn(r *httprouter.Router) {
	r.POST("/:id", c.AddSlotMachine)
	r.DELETE("/:id", c.RemoveSlotMachine)
	r.PUT("/:id/add-token", c.AddTokens)
	r.PUT("/:id/remove-tokens", c.RemoveTokens)
}
