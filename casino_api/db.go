package main

import (
	"context"
)

const NotFoundError = "item was not found"

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
