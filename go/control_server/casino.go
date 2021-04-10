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
	ID     string
	Tokens int
}

// SlotMachineDb provides thread-safe access to the database of slot-casino.
type SlotMachineDb interface {
	// AddSlotMachine adds a slot-machine with a new id.
	AddSlotMachine(ctx context.Context) (id string, err error)

	// ListSlotMachines returns a list of all the slot-casino.
	ListSlotMachines(context.Context) ([]*SlotMachine, error)

	// GetTokenCount retrieves a number of runs a slot-machine has left.
	GetTokenCount(ctx context.Context, id string) (int, error)

	// SetTokenCount sets the number of runs a slot-machine has left.
	SetTokenCount(ctx context.Context, id string, amount int) error

	// DeleteSlotMachine removes a slot-machine from the database.
	DeleteSlotMachine(ctx context.Context, id string) error
}

// Casino holds the SlotMachineDatabase
type Casino struct {
	DB SlotMachineDb

	logWriter io.Writer
	errorClient *errorreporting.Client
}

func NewCasino(projectID string, db SlotMachineDb) (*Casino, error) {
	ctx := context.Background()

	errorClient, err := errorreporting.NewClient(ctx, projectID, errorreporting.Config{
		ServiceName: "Casino",
		OnError: func(err error) {
			_, _ = fmt.Fprintf(os.Stderr, "Could not log error: %v", err)
		},
	})
	if err != nil {
		return  nil, fmt.Errorf("errorreporting.NewClient: %v", err)
	}
	c := &Casino{
		logWriter:   os.Stderr,
		errorClient: errorClient,
		DB: db,
	}
	return c, nil
}
