package main

import (
	"cloud.google.com/go/logging"
	"github.com/gorilla/mux"
	"github.com/gorilla/websocket"
	"log"
	"net/http"
	"time"
)

const (
	writeWait  = 10 * time.Second
	pongWait   = 60 * time.Second
	pingPeriod = (pongWait * 9) / 10
)

var (
	upgrader = websocket.Upgrader{
		ReadBufferSize:  1024,
		WriteBufferSize: 1024,
	}
)

func ServeWebSocket(r *mux.Router) {
	r.HandleFunc("/db/slot-machines/changes", Changes)
}

func Changes(w http.ResponseWriter, r *http.Request) {
	ws, err := upgrader.Upgrade(w, r, nil)
	if err != nil {
		if _, ok := err.(websocket.HandshakeError); !ok {
			log.Println(err)
		}
		return
	}

	go writer(ws)
	reader(ws)
}

func writer(ws *websocket.Conn) {
	pingTicker := time.NewTicker(pingPeriod)
	cancel := db.ListenToSlotMachineChanges(func(m *SlotMachine) {
		_ = ws.SetWriteDeadline(time.Now().Add(writeWait))
		if err := ws.WriteJSON(m); err != nil {
			webSocketLogger(logging.Error).Println(err)
			return
		}
	})
	defer func() {
		cancel()
		pingTicker.Stop()
		_ = ws.Close()
	}()
	for {
		select {
		case <-pingTicker.C:
			_ = ws.SetWriteDeadline(time.Now().Add(writeWait))
			if err := ws.WriteMessage(websocket.PingMessage, []byte{}); err != nil {
				return
			}
		}
	}
}

func reader(ws *websocket.Conn) {
	defer func() {
		_ = ws.Close()
	}()
	ws.SetReadLimit(512)
	_ = ws.SetReadDeadline(time.Now().Add(pongWait))
	ws.SetPongHandler(func(string) error {
		_ = ws.SetReadDeadline(time.Now().Add(pongWait))
		return nil
	})
	for {
		_, _, err := ws.ReadMessage()
		if err != nil {
			break
		}
	}
}

func webSocketLogger(s logging.Severity) *log.Logger {
	return logClient.Logger("web-socket").StandardLogger(s)
}
