package main

import (
	"cloud.google.com/go/logging"
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
	db CasinoDb
	lc *logging.Client
}

func NewWebSocketController(db CasinoDb, lc *logging.Client) *WebSocketController {
	upgrader.CheckOrigin = func(r *http.Request) bool {
		return true
	}
	return &WebSocketController{
		db: db,
		lc: lc,
	}
}

func (c *WebSocketController) RegisterOn(r *mux.Router) {
	r.HandleFunc("/db/slot-machines/changes", func(w http.ResponseWriter, r *http.Request) {
		c.logger(logging.Info).Println("request: listen to all changes")
		c.changesOf(w, r, func(machine *SlotMachine) bool {
			return true
		})
	})
	r.HandleFunc("/db/slot-machines/{"+idParam+"}/changes", func(w http.ResponseWriter, r *http.Request) {
		id := mux.Vars(r)[idParam]
		c.logger(logging.Info).Printf("request: listen to changes of %s", id)
		c.changesOf(w, r, func(machine *SlotMachine) bool {
			return machine.ID == id
		})
	})
}

func (c *WebSocketController) changesOf(w http.ResponseWriter, r *http.Request, predicate func(*SlotMachine) bool) {
	ws, err := upgrader.Upgrade(w, r, nil)
	if err != nil {
		if _, ok := err.(websocket.HandshakeError); !ok {
			c.logger(logging.Error).Println(err)
		}
		return
	}
	cancel := c.db.ListenToSlotMachineChanges(func(machine *SlotMachine) {
		if predicate(machine) {
			err := ws.WriteJSON(machine)
			if err != nil {
				c.logger(logging.Error).Println(err)
			} else {
				c.logger(logging.Info).Println("wrote changes")
			}
		}
	})
	ws.SetCloseHandler(func(code int, text string) error {
		cancel()
		c.logger(logging.Info).Println("closed socket")
		return nil
	})
}

func (c *WebSocketController) logger(s logging.Severity) *log.Logger {
	return c.lc.Logger("web-socket").StandardLogger(s)
}
