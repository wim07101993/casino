package main

import (
	"cloud.google.com/go/firestore"
	"cloud.google.com/go/logging"
	"context"
	"fmt"
	"log"
	"os"
)

type Env struct {
	port      string
	projectID string
	online    bool
}

type Instantiator struct {
	firestoreClient     *firestore.Client
	logClient           *logging.Client
	env                 *Env
	casino              *Casino
	controller          *Controller
	firestoreDb         *FirestoreDb
	memoryDb            *MemoryDb
	webSocketController *WebSocketController
}

func (i *Instantiator) IsOnline() bool {
	env := i.Env()
	return env.online && env.projectID != ""
}

func (i *Instantiator) FirestoreClient() (*firestore.Client, error) {
	if i.firestoreClient != nil {
		return i.firestoreClient, nil
	}

	ctx := context.Background()

	c, err := firestore.NewClient(ctx, i.env.projectID)
	if err != nil {
		return nil, fmt.Errorf("could not create firestore client: %v", err)
	}
	i.firestoreClient = c
	return i.firestoreClient, nil
}

func (i *Instantiator) LogClient() (*logging.Client, error) {
	if i.logClient != nil {
		return i.logClient, nil
	}

	ctx := context.Background()

	lc, err := logging.NewClient(ctx, i.env.projectID)
	if err != nil {
		return nil, fmt.Errorf("error while creating logclient: %v", err)
	}
	i.logClient = lc
	return lc, nil
}

func (i *Instantiator) Casino() (*Casino, error) {
	if i.casino != nil {
		return i.casino, nil
	}

	db, err := i.DB()
	if err != nil {
		return nil, err
	}

	i.casino, err = NewCasino(i.env.projectID, db)
	return i.casino, err
}

func (i *Instantiator) Controller() (*Controller, error) {
	if i.controller != nil {
		return i.controller, nil
	}

	c, err := i.Casino()
	if err != nil {
		return nil, err
	}

	l, err := i.Logger("controller", logging.Info)
	if err != nil {
		return nil, err
	}
	el, err := i.Logger("controller", logging.Error)
	if err != nil {
		return nil, err
	}

	i.controller = NewController(c, l, el)
	return i.controller, err
}

func (i *Instantiator) DB() (CasinoDb, error) {
	if i.IsOnline() {
		return i.FirestoreDB()
	} else {
		return i.MemoryDB()
	}
}

func (i *Instantiator) Env() Env {
	if i.env != nil {
		return *i.env
	}
	i.env = &Env{port: "8080"}
	if port := os.Getenv("PORT"); port != "" {
		i.env.port = port
	}
	i.env.projectID = os.Getenv("GOOGLE_CLOUD_PROJECT")
	i.env.online = true
	return *i.env
}

func (i *Instantiator) FirestoreDB() (*FirestoreDb, error) {
	if i.firestoreDb != nil {
		return i.firestoreDb, nil
	}

	fc, err := i.FirestoreClient()
	if err != nil {
		return nil, err
	}
	el, err := i.Logger("firebase-db", logging.Error)
	if err != nil {
		return nil, err
	}
	l, err := i.Logger("firebase-db", logging.Info)
	if err != nil {
		return nil, err
	}

	i.firestoreDb, err = NewFirestoreDb(fc, el, l)
	if err != nil {
		return nil, fmt.Errorf("could not create firestore db: %v", err)
	}
	return i.firestoreDb, nil
}

func (i *Instantiator) Logger(logID string, severity logging.Severity) (*log.Logger, error) {
	if !i.IsOnline() {
		if severity == logging.Error || severity == logging.Critical {
			return log.New(os.Stderr, severity.String()+" "+logID, log.LstdFlags), nil
		}
		return log.New(os.Stdout, severity.String()+" "+logID, log.LstdFlags), nil
	}

	lc, err := i.LogClient()
	if err != nil {
		return nil, err
	}
	return lc.Logger(logID).StandardLogger(severity), nil
}

func (i *Instantiator) MemoryDB() (*MemoryDb, error) {
	if i.memoryDb != nil {
		return i.memoryDb, nil
	}
	i.memoryDb = NewMemoryDb()
	return i.memoryDb, nil
}

func (i *Instantiator) WebSocketController() (*WebSocketController, error) {
	if i.webSocketController != nil {
		return i.webSocketController, nil
	}

	c, err := i.Casino()
	if err != nil {
		return nil, err
	}
	el, err := i.Logger("web-socket", logging.Error)
	if err != nil {
		return nil, err
	}
	l, err := i.Logger("web-socket", logging.Info)
	if err != nil {
		return nil, err
	}

	i.webSocketController = NewWebSocketController(c, el, l)
	return i.webSocketController, nil
}
