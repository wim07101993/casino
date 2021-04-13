package main

import (
	_ "cloud.google.com/go/errorreporting"
	"cloud.google.com/go/firestore"
	"cloud.google.com/go/logging"
	"context"
	"github.com/julienschmidt/httprouter"
	"log"
	"net/http"
	"os"
)

type Env struct {
	port      string
	projectID string
	key       string
}

var appLogger *logging.Logger

func newEnv() Env {
	env := Env{port: "8080"}
	if port := os.Getenv("PORT"); port != "" {
		env.port = port
	}
	env.projectID = os.Getenv("GOOGLE_CLOUD_PROJECT")
	return env
}

func main() {
	env := newEnv()

	logClient := createLogClient(env)
	appLogger = logClient.Logger("app")
	casino := createCasino(env, logClient)

	r := httprouter.New()
	r.GET("/", func(w http.ResponseWriter, _ *http.Request, _ httprouter.Params) {
		_, _ = w.Write([]byte("Welcome on the slot-machine control server"))
	})

	ctrl := NewController(casino, env.key, logClient.Logger("controller"))
	ctrl.RegisterOn(r)

	appLogger.StandardLogger(logging.Info).Println("Listening on :" + env.port)
	appLogger.StandardLogger(logging.Critical).Fatal(http.ListenAndServe(":"+env.port, r))
}

func createCasino(env Env, logClient *logging.Client) (c *Casino) {
	db := createDb(env, logClient)
	c, err := NewCasino(env.projectID, db)
	if err != nil {
		appLogger.StandardLogger(logging.Critical).Fatalf("could not create casino: %v", err)
	}
	return
}

func createDb(env Env, logClient *logging.Client) (db CasinoDb) {
	if env.projectID != "" {
		ctx := context.Background()
		client, err := firestore.NewClient(ctx, env.projectID)
		if err != nil {
			appLogger.StandardLogger(logging.Critical).Fatalf("could not create firestore client: %v", err)
		}
		logger := logClient.Logger("firestore")
		db, err = NewFirestoreDb(client, logger)
		if err != nil {
			appLogger.StandardLogger(logging.Critical).Fatalf("could not create firestore db: %v", err)
		}
	} else {
		db = newMemoryDb()
	}
	return
}

func createLogClient(env Env) *logging.Client {
	c, err := logging.NewClient(context.Background(), env.projectID)
	if err != nil {
		log.Fatal(err)
	}
	return c
}
