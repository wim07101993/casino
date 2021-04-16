package main

import (
	"cloud.google.com/go/logging"
	"github.com/gorilla/mux"
	"github.com/gorilla/websocket"
	"net/http"
)

var (
	upgrader = websocket.Upgrader{
		ReadBufferSize:  1024,
		WriteBufferSize: 1024,
	}
)

type WebSocketController struct {
	logger *logging.Logger
	casino *Casino
}

func NewWebSocketController(casino *Casino, logger *logging.Logger) *WebSocketController {
	return &WebSocketController{
		logger: logger,
		casino: casino,
	}
}

func (c *WebSocketController) RegisterOn(r *mux.Router) {
	r.HandleFunc("/casino/slot-machines/changes", func(w http.ResponseWriter, r *http.Request) {
		c.changesOf(w, r, func(machine SlotMachine) bool {
			return true
		})
	})
	r.HandleFunc("/casino/slot-machines/:"+idParam+"/changes", func(w http.ResponseWriter, r *http.Request) {
		id := mux.Vars(r)[idParam]
		c.changesOf(w, r, func(machine SlotMachine) bool {
			return machine.ID == id
		})
	})
}

func (c *WebSocketController) changesOf(w http.ResponseWriter, r *http.Request, predicate func(SlotMachine) bool) {
	ws, err := upgrader.Upgrade(w, r, nil)
	if err != nil {
		if _, ok := err.(websocket.HandshakeError); !ok {
			c.logger.StandardLogger(logging.Error).Println(err)
		}
		return
	}
	cancel, err := c.casino.DB.ListenToSlotMachineChanges(r.Context(), func(machine SlotMachine) {
		if predicate(machine) {
			err := ws.WriteJSON(machine)
			c.logger.StandardLogger(logging.Error).Println(err)
		}
	})
	if err != nil {
		c.logger.StandardLogger(logging.Error).Println(err)
	}
	ws.SetCloseHandler(func(code int, text string) error {
		cancel()
		return nil
	})
}
