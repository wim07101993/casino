package main

import (
	_ "cloud.google.com/go/errorreporting"
	"cloud.google.com/go/firestore"
	"cloud.google.com/go/logging"
	"context"
	"github.com/gorilla/handlers"
	"github.com/gorilla/mux"
	"log"
	"net/http"
	"os"
)

var projectID = os.Getenv("GOOGLE_CLOUD_PROJECT")
var port = os.Getenv("PORT")

var logClient *logging.Client
var firestoreClient *firestore.Client
var db CasinoDb

func main() {
	if port == "" {
		port = "8080"
	}

	var err error

	if logClient, err = logging.NewClient(context.Background(), projectID); err != nil {
		log.Fatalf("Could not instantiate log-client: %s", err)
	}
	if firestoreClient, err = firestore.NewClient(context.Background(), projectID); err != nil {
		log.Fatalf("Could not instantiate firestore-client %s", err)
	}
	if db, err = NewFirestoreDb(firestoreClient, logClient); err != nil {
		log.Fatalf("Could not instantiate db %s", err)
	}

	r := mux.NewRouter()
	ServeRest(r)
	// not available for google app engine, only google app engine flex
	//ServeWebSocket(r)

	ms := handlers.AllowedMethods([]string{"GET", "HEAD", "POST", "PUT", "OPTIONS"})

	logger := logClient.Logger("main")
	logger.StandardLogger(logging.Info).Println("Listening on :" + port)
	logger.StandardLogger(logging.Critical).Print(http.ListenAndServe(":"+port, handlers.CORS(ms)(r)))
}
