package main

import (
	"cloud.google.com/go/errorreporting"
	"context"
	"fmt"
	"io"
	"os"
)

// SlotMachine holds the data of a slot-machine
type SlotMachine struct {
	ID     string `json:"id"`
	Name   string `json:"name"`
	Tokens int    `json:"tokens"`
}

// Casino holds the SlotMachineDatabase
type Casino struct {
	DB CasinoDb

	logWriter   io.Writer
	errorClient *errorreporting.Client
}

func NewCasino(projectID string, db CasinoDb) (*Casino, error) {
	ctx := context.Background()

	errorClient, err := errorreporting.NewClient(ctx, projectID, errorreporting.Config{
		ServiceName: "Casino-api",
		OnError: func(err error) {
			_, _ = fmt.Fprintf(os.Stderr, "Could not log error: %v", err)
		},
	})
	if err != nil {
		return nil, fmt.Errorf("errorreporting.NewClient: %v", err)
	}
	c := &Casino{
		logWriter:   os.Stderr,
		errorClient: errorClient,
		DB:          db,
	}
	return c, nil
}
