package slotmachine

import (
	"errors"
	"sync"
)

const NotFoundError = "slot machine not found"
const AlreadyRegisteredError = "id already registered"

type Repository struct {
	machines map[string]*SlotMachine
	lock     *sync.Mutex
}

func NewRepository() *Repository {
	return &Repository{
		machines: map[string]*SlotMachine{},
		lock: &sync.Mutex{},
	}
}

func (r *Repository) AddSlotMachine(id string) error{
	r.lock.Lock()
	defer r.lock.Unlock()
	_, ok := r.machines[id]
	if ok {
		return errors.New(AlreadyRegisteredError)
	}
	r.machines[id] = &SlotMachine{id: id}
	return nil
}

func (r *Repository) RemoveSlotMachine(id string) error {
	return r.searchAndDo(id, func(m *SlotMachine) {
		delete(r.machines, id)
	})
}

func (r *Repository) AddTokens(id string, amount int) error {
	return r.searchAndDo(id, func(m *SlotMachine) {
		m.tokens += amount
	})
}

func (r *Repository) RemoveTokens(id string, amount int) error {
	return r.searchAndDo(id, func(m *SlotMachine) {
		m.tokens -= amount
	})
}

func (r *Repository) searchAndDo(id string, do func(m *SlotMachine)) error{
	r.lock.Lock()
	defer r.lock.Unlock()
	m, ok := r.machines[id]
	if !ok {
		return errors.New(NotFoundError)
	}
	do(m)
	return nil
}