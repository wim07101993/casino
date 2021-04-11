package main

import (
	_ "cloud.google.com/go/errorreporting"
	"cloud.google.com/go/firestore"
	"context"
	"github.com/julienschmidt/httprouter"
	"log"
	"net/http"
	"os"
)

type Env struct {
	port         string
	projectID    string
	key          string
	useFireStore bool
}

func newEnv() Env {
	env := Env{port: "8080"}
	if port := os.Getenv("PORT"); port != "" {
		env.port = port
	}
	project := os.Getenv("GOOGLE_CLOUD_PROJECT")
	if project == "" {
		log.Fatal("GOOGLE_CLOUD_PROJECT must be set")
	}
	return env
}

func main() {
	env := newEnv()

	casino := createCasino(env)

	r := httprouter.New()
	r.GET("/", func(w http.ResponseWriter, _ *http.Request, _ httprouter.Params) {
		_, err := w.Write([]byte("Welcome on the slot-machine control server"))
		if err != nil {
			w.WriteHeader(http.StatusInternalServerError)
		} else {
			w.WriteHeader(http.StatusOK)
		}
	})

	ctrl := NewController(casino, env.key)
	ctrl.RegisterOn(r)

	log.Println("Listening on :" + env.port)
	log.Fatal(http.ListenAndServe(":"+env.port, r))
}

func createCasino(env Env) (c *Casino) {
	db := createDb(env)
	c, err := NewCasino(env.projectID, db)
	if err != nil {
		log.Fatalf("could not create casino: %v", err)
	}
	return
}

func createDb(env Env) (db CasinoDb) {
	if env.useFireStore {
		ctx := context.Background()
		client, err := firestore.NewClient(ctx, env.projectID)
		if err != nil {
			log.Fatalf("could not create firestore client: %v", err)
		}
		db, err = NewFirestoreDb(client)
		if err != nil {
			log.Fatalf("could not create firestore db: %v", err)
		}
	} else {
		db = newMemoryDb()
	}
	return
}
