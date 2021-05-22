package main

import (
	"cloud.google.com/go/logging"
	"encoding/json"
	"github.com/gorilla/mux"
	"golang.org/x/tools/go/ssa/interp/testdata/src/errors"
	"log"
	"net/http"
	"strconv"
)

const idParam = "id"
const nameParam = "name"

func RegisterRoutes(r *mux.Router) {
	r.HandleFunc("/db/slot-machines", AddSlotMachineHandler{}.Handle).Methods("POST")
	r.HandleFunc("/db/slot-machines", ListSlotMachines).Methods("GET")
	r.HandleFunc("/db/slot-machines/by-name/{"+nameParam+"}", GetByName).Methods("GET")
	r.HandleFunc("/db/slot-machines/{"+idParam+"}/tokens", GetTokenCount).Methods("GET")
	r.HandleFunc("/db/slot-machines/{"+idParam+"}/tokens", SetTokenCountHandler{}.Handle).Methods("PUT")
	r.HandleFunc("/db/slot-machines/{"+idParam+"}/name", SetNameHandler{}.Handler).Methods("PUT")
	r.HandleFunc("/db/slot-machines/{"+idParam+"}", RemoveSlotMachine).Methods("DELETE")
}

func ListSlotMachines(w http.ResponseWriter, r *http.Request) {
	controllerLog(logging.Info).Println("Request: get all slot-machines")
	ms, err := db.ListSlotMachines(r.Context())
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}
	bs, err := json.Marshal(ms)
	if err != nil {
		controllerLog(logging.Error).Println("ListSlotMachines: ", err)
		w.WriteHeader(http.StatusInternalServerError)
		return
	}
	_, _ = w.Write(bs)
}

func GetByName(w http.ResponseWriter, r *http.Request) {
	controllerLog(logging.Info).Println("Request: add slot-machine")
	name := mux.Vars(r)[nameParam]
	if name == "" {
		w.WriteHeader(http.StatusBadRequest)
		_, _ = w.Write([]byte("please provide the name of the slot-machine to get"))
	}

	m, err := db.GetByName(r.Context(), name)
	if err != nil {
		errMessage := err.Error()
		if errMessage == NotFoundError {
			w.WriteHeader(http.StatusNotFound)
			_, _ = w.Write([]byte("slot-machine was not found"))
		} else {
			w.WriteHeader(http.StatusInternalServerError)
			_, _ = w.Write([]byte(err.Error()))
		}
		return
	}

	bs, err := json.Marshal(m)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		_, _ = w.Write([]byte(err.Error()))
		return
	}
	_, _ = w.Write(bs)
}

func GetTokenCount(w http.ResponseWriter, r *http.Request) {
	controllerLog(logging.Info).Println("Request: get token count")
	id := mux.Vars(r)[idParam]
	if id == "" {
		w.WriteHeader(http.StatusBadRequest)
		_, _ = w.Write([]byte("please provide the id of the slot-machine to get the token count of"))
	}

	amount, err := db.GetTokenCount(r.Context(), id)
	if err != nil {
		errMessage := err.Error()
		if errMessage == NotFoundError {
			w.WriteHeader(http.StatusNotFound)
			_, _ = w.Write([]byte("slot-machine was not found"))
		} else {
			w.WriteHeader(http.StatusInternalServerError)
			_, _ = w.Write([]byte(err.Error()))
		}
		return
	}

	_, _ = w.Write([]byte(strconv.Itoa(amount)))
}

func RemoveSlotMachine(w http.ResponseWriter, r *http.Request) {
	controllerLog(logging.Info).Println("Request: delete slot-machine")
	id := mux.Vars(r)[idParam]
	if id == "" {
		w.WriteHeader(http.StatusBadRequest)
		_, _ = w.Write([]byte("please provide the id of the slot-machine to get the token count of"))
	}

	err := db.DeleteSlotMachine(r.Context(), id)
	if err != nil {
		errMessage := err.Error()
		if errMessage == NotFoundError {
			w.WriteHeader(http.StatusNotFound)
			_, _ = w.Write([]byte("slot-machine was not found"))
		} else {
			w.WriteHeader(http.StatusInternalServerError)
			_, _ = w.Write([]byte(err.Error()))
		}
		return
	}
}

func controllerLog(s logging.Severity) *log.Logger {
	return logClient.Logger("controller").StandardLogger(s)
}

type AddSlotMachineHandler struct{}

func (h AddSlotMachineHandler) Handle(w http.ResponseWriter, r *http.Request) {
	controllerLog(logging.Info).Println("Request: add slot-machine")
	m, err := h.getAndValidateInput(r)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		_, _ = w.Write([]byte(err.Error()))
		return
	}

	id, err := db.AddSlotMachine(r.Context(), m)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	w.WriteHeader(http.StatusCreated)
	_, _ = w.Write([]byte(id))
}

func (_ AddSlotMachineHandler) getAndValidateInput(r *http.Request) (m *SlotMachine, err error) {
	m = &SlotMachine{}
	err = json.NewDecoder(r.Body).Decode(m)
	if err != nil {
		return nil, errors.New("invalid json: " + err.Error())
	}
	if m.Name == "" {
		return nil, errors.New("the name cannot be empty")
	}
	if m.Tokens < 0 {
		return nil, errors.New("the token count must be a positive integer")
	}
	return m, nil
}

type SetTokenCountHandler struct{}

func (h SetTokenCountHandler) Handle(w http.ResponseWriter, r *http.Request) {
	controllerLog(logging.Info).Println("Request: set token count")
	id, amount, err := h.getAndValidateInput(r)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		_, _ = w.Write([]byte(err.Error()))
	}
	err = db.SetTokenCount(r.Context(), id, amount)
	if err != nil {
		errMessage := err.Error()
		if errMessage == NotFoundError {
			w.WriteHeader(http.StatusNotFound)
			_, _ = w.Write([]byte("slot-machine was not found"))
		} else {
			w.WriteHeader(http.StatusInternalServerError)
			_, _ = w.Write([]byte(err.Error()))
		}
	}
}

func (_ SetTokenCountHandler) getAndValidateInput(r *http.Request) (id string, amount int, err error) {
	id = mux.Vars(r)[idParam]
	if id == "" {
		return "", 0, errors.New("please provide an id")
	}
	err = json.NewDecoder(r.Body).Decode(&amount)
	if err != nil {
		return "", 0, errors.New("please provide a positive integer amount to set the token count to")
	}
	if amount < 0 {
		return "", 0, errors.New("the amount must be a positive number")
	}
	return id, amount, nil
}

type SetNameHandler struct{}

func (h SetNameHandler) Handler(w http.ResponseWriter, r *http.Request) {
	controllerLog(logging.Info).Printf("Request: set name")
	id, name, err := h.getAndValidateInput(r)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		_, _ = w.Write([]byte(err.Error()))
		return
	}
	err = db.SetName(r.Context(), id, name)
	if err != nil {
		errMessage := err.Error()
		if errMessage == NotFoundError {
			w.WriteHeader(http.StatusNotFound)
			_, _ = w.Write([]byte("slot-machine was not found"))
		} else {
			w.WriteHeader(http.StatusInternalServerError)
			_, _ = w.Write([]byte(err.Error()))
		}
	}
}

func (_ SetNameHandler) getAndValidateInput(r *http.Request) (id string, name string, err error) {
	id = mux.Vars(r)[idParam]
	if id == "" {
		return "", "", errors.New("please provide the id of the slot-machine to set the name of")
	}
	err = json.NewDecoder(r.Body).Decode(&name)
	if err != nil {
		return "", "", errors.New("please provide a name.")
	}
	if name == "" {
		return "", "", errors.New("the name cannot be empty")
	}
	return id, name, nil
}
