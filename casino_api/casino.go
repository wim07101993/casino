package main

import (
	"strconv"
)

// SlotMachine holds the data of a slot-machine
type SlotMachine struct {
	ID     string `json:"id"`
	Name   string `json:"name"`
	Tokens int    `json:"tokens"`
}

func (s SlotMachine) String() string {
	return "SlotMachine(ID: " + s.ID + ", Name" + s.Name + ", Tokens: " + strconv.Itoa(s.Tokens) + ")"
}
