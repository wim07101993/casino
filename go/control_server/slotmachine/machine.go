package slotmachine

import (
	"errors"
	"log"
	"sync"
)

const NotFoundError = "slot machine not found"
const AlreadyRegisteredError = "id already registered"

type SlotMachine struct {
	id string
	tokens int
}

type Machines struct {
	db   map[string]*SlotMachine
	lock *sync.Mutex
}

func NewMachines() *Machines {
	return &Machines{
		db:   map[string]*SlotMachine{},
		lock: &sync.Mutex{},
	}
}

func (ms *Machines) AddSlotMachine(id string) error {
	ms.lock.Lock()
	defer ms.lock.Unlock()
	_, ok := ms.db[id]
	if ok {
		return errors.New(AlreadyRegisteredError)
	}
	ms.db[id] = &SlotMachine{id: id}
	return nil
}

func (ms *Machines) RemoveSlotMachine(id string) error {
	return ms.searchAndDo(id, func(m *SlotMachine) {
		delete(ms.db, id)
	})
}

func (ms *Machines) AddTokens(id string, amount int) error {
	return ms.searchAndDo(id, func(m *SlotMachine) {
		m.tokens += amount
	})
}

func (ms *Machines) RemoveTokens(id string, amount int) error {
	log.Printf("removing %s tokens from %s", id, amount)
	return ms.searchAndDo(id, func(m *SlotMachine) {
		m.tokens -= amount
	})
}

func (ms *Machines) Machines() []SlotMachine {
	log.Println("listing all machines")
	l := len(ms.db)
	ret := make([]SlotMachine, 0, l)
	i := 0
	for _, v := range ms.db {
		ret[i] = *v
		i++
	}
	return ret
}

func (ms *Machines) Amount(id string) (int, error) {
	log.Printf("getting amount from %s\r\n", id)
	amount := 0
	err := ms.searchAndDo(id, func(m *SlotMachine) {
		amount = m.tokens
	})
	return amount, err
}

func (ms *Machines) searchAndDo(id string, do func(m *SlotMachine)) error {
	ms.lock.Lock()
	defer ms.lock.Unlock()
	m, ok := ms.db[id]
	if !ok {
		return errors.New(NotFoundError)
	}
	do(m)
	return nil
}
