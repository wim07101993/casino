package main

import (
	"github.com/gorilla/mux"
	"github.com/gorilla/websocket"
	"log"
	"net/http"
)

var (
	upgrader = websocket.Upgrader{
		ReadBufferSize:  1024,
		WriteBufferSize: 1024,
	}
)

type WebSocketController struct {
	errorLogger *log.Logger
	logger      *log.Logger
	casino      *Casino
}

func NewWebSocketController(casino *Casino, errorLogger *log.Logger, logger *log.Logger) *WebSocketController {
	upgrader.CheckOrigin = func(r *http.Request) bool {
		return true
	}
	return &WebSocketController{
		errorLogger: errorLogger,
		casino:      casino,
		logger:      logger,
	}
}

func (c *WebSocketController) RegisterOn(r *mux.Router) {
	r.HandleFunc("/casino/slot-machines/changes", func(w http.ResponseWriter, r *http.Request) {
		c.logger.Println("request: listen to all changes")
		c.changesOf(w, r, func(machine SlotMachine) bool {
			return true
		})
	})
	r.HandleFunc("/casino/slot-machines/{"+idParam+"}/changes", func(w http.ResponseWriter, r *http.Request) {
		id := mux.Vars(r)[idParam]
		c.logger.Printf("request: listen to changes of %s", id)
		c.changesOf(w, r, func(machine SlotMachine) bool {
			return machine.ID == id
		})
	})
}

func (c *WebSocketController) changesOf(w http.ResponseWriter, r *http.Request, predicate func(SlotMachine) bool) {
	ws, err := upgrader.Upgrade(w, r, nil)
	if err != nil {
		if _, ok := err.(websocket.HandshakeError); !ok {
			c.errorLogger.Println(err)
		}
		return
	}
	cancel := c.casino.DB.ListenToSlotMachineChanges(func(machine SlotMachine) {
		if predicate(machine) {
			err := ws.WriteJSON(machine)
			if err != nil {
				c.errorLogger.Println(err)
			} else {
				c.logger.Println("wrote changes")
			}
		}
	})
	ws.SetCloseHandler(func(code int, text string) error {
		cancel()
		c.logger.Println("closed socket")
		return nil
	})
}
