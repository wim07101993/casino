package main

import (
	"context"
	"github.com/google/uuid"
	"sort"
	"sync"
)

type memoryDb struct {
	mu           sync.Mutex
	slotMachines map[string]*SlotMachine
}

func newMemoryDb() *memoryDb {
	return &memoryDb{
		slotMachines: map[string]*SlotMachine{},
	}
}

func (db *memoryDb) Close(context.Context) error {
	db.mu.Lock()
	defer db.mu.Unlock()
	db.slotMachines = nil
	return nil
}

// AddSlotMachine adds a slot-machine with a new id.
func (db *memoryDb) AddSlotMachine(_ context.Context, slotMachine *SlotMachine) (id string, err error) {
	db.mu.Lock()
	defer db.mu.Unlock()
	slotMachine.ID = uuid.New().String()
	db.slotMachines[id] = slotMachine
	return id, nil
}

// ListSlotMachines returns a list of all the slot-casino.
func (db *memoryDb) ListSlotMachines(context.Context) ([]*SlotMachine, error) {
	db.mu.Lock()
	db.mu.Unlock()
	ms := make([]*SlotMachine, 0, len(db.slotMachines))
	for _, m := range db.slotMachines {
		ms = append(ms, m)
	}
	sort.Slice(ms, func(i, j int) bool {
		return ms[i].Name < ms[j].Name
	})
	return ms, nil
}

// GetTokenCount retrieves a number of runs a slot-machine has left.
func (db *memoryDb) GetTokenCount(ctx context.Context, id string) (int, error) {
	db.mu.Lock()
	defer db.mu.Unlock()
	if m, ok := db.slotMachines[id]; ok {
		return m.Tokens, nil
	}
	return 0, NotFoundError{"SlotMachine", id}
}

// SetTokenCount sets the number of runs a slot-machine has left.
func (db *memoryDb) SetTokenCount(ctx context.Context, id string, count int) error {
	db.mu.Lock()
	defer db.mu.Unlock()
	if m, ok := db.slotMachines[id]; ok {
		m.Tokens = count
		return nil
	}
	return NotFoundError{"SlotMachine", id}
}

// DeleteSlotMachine removes a slot-machine from the database.
func (db *memoryDb) DeleteSlotMachine(_ context.Context, id string) error {
	db.mu.Lock()
	defer db.mu.Unlock()
	delete(db.slotMachines, id)
	return nil
}
