package main

import (
	"context"
	"fmt"
)

// CasinoDb provides thread-safe access to the database of slot-casino.
type CasinoDb interface {
	// AddSlotMachine adds a slot-machine with a new id.
	AddSlotMachine(ctx context.Context, slotMachine *SlotMachine) (id string, err error)

	// ListSlotMachines returns a list of all the slot-casino.
	ListSlotMachines(context.Context) ([]*SlotMachine, error)

	// GetTokenCount retrieves a number of runs a slot-machine has left.
	GetTokenCount(ctx context.Context, id string) (int, error)

	// SetTokenCount sets the number of runs a slot-machine has left.
	SetTokenCount(ctx context.Context, id string, count int) error

	// DeleteSlotMachine removes a slot-machine from the database.
	DeleteSlotMachine(ctx context.Context, id string) error

	// ListenToSlotMachineChanges listens to the changes of all slot-machines.
	ListenToSlotMachineChanges(ctx context.Context, f func(machine SlotMachine)) (cancel func(), err error)
}

type NotFoundError struct {
	Type string
	ID   string
}

func (e NotFoundError) Error() string {
	return fmt.Sprintf("%s with id %s was not found", e.Type, e.ID)
}
