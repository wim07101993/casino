package main

import (
	"context"
	"errors"
	"github.com/google/uuid"
	"sort"
	"sync"
)

type MemoryDb struct {
	mu           sync.Mutex
	slotMachines map[string]*SlotMachine
	listeners    []*func(*SlotMachine)
}

func NewMemoryDb() *MemoryDb {
	return &MemoryDb{
		slotMachines: map[string]*SlotMachine{},
		listeners:    []*func(*SlotMachine){},
	}
}

func (db *MemoryDb) Close(context.Context) error {
	db.mu.Lock()
	defer db.mu.Unlock()
	db.slotMachines = nil
	return nil
}

func (db *MemoryDb) AddSlotMachine(_ context.Context, slotMachine *SlotMachine) (id string, err error) {
	db.mu.Lock()
	defer db.mu.Unlock()
	id = uuid.New().String()
	slotMachine.ID = id
	db.slotMachines[id] = slotMachine
	return id, nil
}

func (db *MemoryDb) ListSlotMachines(_ context.Context) ([]*SlotMachine, error) {
	db.mu.Lock()
	defer db.mu.Unlock()
	ms := make([]*SlotMachine, 0, len(db.slotMachines))
	for _, m := range db.slotMachines {
		ms = append(ms, &*m)
	}
	sort.Slice(ms, func(i, j int) bool {
		return ms[i].Name < ms[j].Name
	})
	return ms, nil
}

func (db *MemoryDb) GetByName(_ context.Context, name string) (*SlotMachine, error) {
	db.mu.Lock()
	defer db.mu.Unlock()
	for _, m := range db.slotMachines {
		if m.Name == name {
			return &*m, nil
		}
	}
	return nil, errors.New(NotFoundError)
}

func (db *MemoryDb) GetTokenCount(_ context.Context, id string) (int, error) {
	db.mu.Lock()
	defer db.mu.Unlock()
	if m, ok := db.slotMachines[id]; ok {
		return m.Tokens, nil
	}
	return 0, errors.New(NotFoundError)
}

func (db *MemoryDb) SetTokenCount(_ context.Context, id string, count int) error {
	db.mu.Lock()
	defer db.mu.Unlock()
	if m, ok := db.slotMachines[id]; ok {
		m.Tokens = count
		for _, l := range db.listeners {
			(*l)(m)
		}
		return nil
	}
	return errors.New(NotFoundError)
}

func (db *MemoryDb) SetName(_ context.Context, id string, name string) error {
	db.mu.Lock()
	defer db.mu.Unlock()
	if m, ok := db.slotMachines[id]; ok {
		m.Name = name
		for _, l := range db.listeners {
			(*l)(m)
		}
		return nil
	}
	return errors.New(NotFoundError)
}

func (db *MemoryDb) DeleteSlotMachine(_ context.Context, id string) error {
	db.mu.Lock()
	defer db.mu.Unlock()
	delete(db.slotMachines, id)
	return nil
}

func (db *MemoryDb) ListenToSlotMachineChanges(f func(*SlotMachine)) (cancel func()) {
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
		db.listeners = db.listeners[:len(db.listeners)-1]
	}
	return cancel
}
