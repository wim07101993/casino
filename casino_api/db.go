package main

import (
	"context"
	"fmt"
)

type CasinoDb interface {
	AddSlotMachine(ctx context.Context, slotMachine *SlotMachine) (id string, err error)
	ListSlotMachines(ctx context.Context) ([]*SlotMachine, error)
	GetByName(ctx context.Context, name string) (*SlotMachine, error)
	GetTokenCount(ctx context.Context, id string) (int, error)
	SetTokenCount(ctx context.Context, id string, count int) error
	SetName(ctx context.Context, id string, name string) error
	DeleteSlotMachine(ctx context.Context, id string) error
	ListenToSlotMachineChanges(f func(machine *SlotMachine)) (cancel func())
}

type IdNotFoundError struct {
	Type string
	ID   string
}

func (e IdNotFoundError) Error() string {
	return fmt.Sprintf("%s with id %s was not found", e.Type, e.ID)
}

type NameNotFound struct {
	Type string
	Name string
}

func (e NameNotFound) Error() string {
	return fmt.Sprintf("%s with name %s was not found", e.Type, e.Name)
}
