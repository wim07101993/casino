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

type DI struct {
	firestoreClient     *firestore.Client
	logClient           *logging.Client
	env                 *Env
	casino              *Casino
	controller          *Controller
	firestoreDb         *FirestoreDb
	memoryDb            *MemoryDb
	webSocketController *WebSocketController
}

func (di *DI) IsOnline() bool {
	env := di.Env()
	return env.online && env.projectID != ""
}

func (di *DI) FirestoreClient() (*firestore.Client, error) {
	if di.firestoreClient != nil {
		return di.firestoreClient, nil
	}

	ctx := context.Background()

	c, err := firestore.NewClient(ctx, di.env.projectID)
	if err != nil {
		return nil, fmt.Errorf("could not create firestore client: %v", err)
	}
	di.firestoreClient = c
	return di.firestoreClient, nil
}

func (di *DI) LogClient() (*logging.Client, error) {
	if di.logClient != nil {
		return di.logClient, nil
	}

	ctx := context.Background()

	lc, err := logging.NewClient(ctx, di.env.projectID)
	if err != nil {
		return nil, fmt.Errorf("error while creating logclient: %v", err)
	}
	di.logClient = lc
	return lc, nil
}

func (di *DI) Casino() (*Casino, error) {
	if di.casino != nil {
		return di.casino, nil
	}

	db, err := di.DB()
	if err != nil {
		return nil, err
	}

	di.casino, err = NewCasino(di.env.projectID, db)
	return di.casino, err
}

func (di *DI) Controller() (*Controller, error) {
	if di.controller != nil {
		return di.controller, nil
	}

	c, err := di.Casino()
	if err != nil {
		return nil, err
	}

	l, err := di.Logger("controller", logging.Info)
	if err != nil {
		return nil, err
	}
	el, err := di.Logger("controller", logging.Error)
	if err != nil {
		return nil, err
	}

	di.controller = NewController(c, l, el)
	return di.controller, err
}

func (di *DI) DB() (CasinoDb, error) {
	if di.IsOnline() {
		return di.FirestoreDB()
	} else {
		return di.MemoryDB()
	}
}

func (di *DI) Env() Env {
	if di.env != nil {
		return *di.env
	}
	di.env = &Env{port: "8080"}
	if port := os.Getenv("PORT"); port != "" {
		di.env.port = port
	}
	di.env.projectID = os.Getenv("GOOGLE_CLOUD_PROJECT")
	di.env.online = true
	return *di.env
}

func (di *DI) FirestoreDB() (*FirestoreDb, error) {
	if di.firestoreDb != nil {
		return di.firestoreDb, nil
	}

	fc, err := di.FirestoreClient()
	if err != nil {
		return nil, err
	}
	el, err := di.Logger("firebase-db", logging.Error)
	if err != nil {
		return nil, err
	}
	l, err := di.Logger("firebase-db", logging.Info)
	if err != nil {
		return nil, err
	}

	di.firestoreDb, err = NewFirestoreDb(fc, el, l)
	if err != nil {
		return nil, fmt.Errorf("could not create firestore db: %v", err)
	}
	return di.firestoreDb, nil
}

func (di *DI) Logger(logID string, severity logging.Severity) (*log.Logger, error) {
	if !di.IsOnline() {
		if severity == logging.Error || severity == logging.Critical {
			return log.New(os.Stderr, severity.String()+" "+logID, log.LstdFlags), nil
		}
		return log.New(os.Stdout, severity.String()+" "+logID, log.LstdFlags), nil
	}

	lc, err := di.LogClient()
	if err != nil {
		return nil, err
	}
	return lc.Logger(logID).StandardLogger(severity), nil
}

func (di *DI) MemoryDB() (*MemoryDb, error) {
	if di.memoryDb != nil {
		return di.memoryDb, nil
	}
	di.memoryDb = NewMemoryDb()
	return di.memoryDb, nil
}

func (di *DI) WebSocketController() (*WebSocketController, error) {
	if di.webSocketController != nil {
		return di.webSocketController, nil
	}

	c, err := di.Casino()
	if err != nil {
		return nil, err
	}
	el, err := di.Logger("web-socket", logging.Error)
	if err != nil {
		return nil, err
	}
	l, err := di.Logger("web-socket", logging.Info)
	if err != nil {
		return nil, err
	}

	di.webSocketController = NewWebSocketController(c, el, l)
	return di.webSocketController, nil
}
