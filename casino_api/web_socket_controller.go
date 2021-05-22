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

func ServeWebSocket(r *mux.Router) {
	r.HandleFunc("/casino/slot-machines/changes", Changes)
}

func Changes(w http.ResponseWriter, r *http.Request) {
	ws, err := upgrader.Upgrade(w, r, nil)
	defer func() {
		_ = ws.Close()
	}()
	if err != nil {
		webSocketLogger(logging.Error).Printf("upgrader.Upgrade: %v", err)
		return
	}
	db.ListenToSlotMachineChanges(func(m *SlotMachine) {
		if err := ws.WriteJSON(m); err != nil {
			webSocketLogger(logging.Error).Println(err)
		}
	})
}

func webSocketLogger(s logging.Severity) *log.Logger {
	return logClient.Logger("web-socket").StandardLogger(s)
}
