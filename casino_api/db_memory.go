package main

import (
	"context"
	"github.com/google/uuid"
	"sort"
	"sync"
)

type MemoryDb struct {
	mu           sync.Mutex
	slotMachines map[string]*SlotMachine
	listeners    []*func(SlotMachine)
}

func NewMemoryDb() *MemoryDb {
	return &MemoryDb{
		slotMachines: map[string]*SlotMachine{},
		listeners: []*func(SlotMachine){},
	}
}

func (db *MemoryDb) Close(context.Context) error {
	db.mu.Lock()
	defer db.mu.Unlock()
	db.slotMachines = nil
	return nil
}

// AddSlotMachine adds a slot-machine with a new id.
func (db *MemoryDb) AddSlotMachine(_ context.Context, slotMachine *SlotMachine) (id string, err error) {
	db.mu.Lock()
	defer db.mu.Unlock()
	id = uuid.New().String()
	slotMachine.ID = id
	db.slotMachines[id] = slotMachine
	return id, nil
}

// ListSlotMachines returns a list of all the slot-casino.
func (db *MemoryDb) ListSlotMachines(context.Context) ([]*SlotMachine, error) {
	db.mu.Lock()
	db.mu.Unlock()
	ms := make([]*SlotMachine, 0, len(db.slotMachines))
	for _, m := range db.slotMachines {
		ms = append(ms, &*m)
	}
	sort.Slice(ms, func(i, j int) bool {
		return ms[i].Name < ms[j].Name
	})
	return ms, nil
}

// GetTokenCount retrieves a number of runs a slot-machine has left.
func (db *MemoryDb) GetTokenCount(_ context.Context, id string) (int, error) {
	db.mu.Lock()
	defer db.mu.Unlock()
	if m, ok := db.slotMachines[id]; ok {
		return m.Tokens, nil
	}
	return 0, NotFoundError{"SlotMachine", id}
}

// SetTokenCount sets the number of runs a slot-machine has left.
func (db *MemoryDb) SetTokenCount(_ context.Context, id string, count int) error {
	db.mu.Lock()
	defer db.mu.Unlock()
	if m, ok := db.slotMachines[id]; ok {
		m.Tokens = count
		for _, l := range db.listeners {
			(*l)(*m)
		}
		return nil
	}
	return NotFoundError{"SlotMachine", id}
}

// DeleteSlotMachine removes a slot-machine from the database.
func (db *MemoryDb) DeleteSlotMachine(_ context.Context, id string) error {
	db.mu.Lock()
	defer db.mu.Unlock()
	delete(db.slotMachines, id)
	return nil
}

func (db *MemoryDb) ListenToSlotMachineChanges(_ context.Context, f func(machine SlotMachine)) (cancel func(), err error) {
	db.listeners = append(db.listeners, &f)
	cancel = func() {
		i := -1
		for i = range db.listeners {
			if db.listeners[i] == &f {
				break
			}
		}
		if i == -1 {
			return
		}
		db.listeners[i] = db.listeners[len(db.listeners)]
		db.listeners = db.listeners[:len(db.listeners) - 1]
	}
	return cancel, nil
}
