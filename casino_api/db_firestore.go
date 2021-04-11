package main

import (
	"cloud.google.com/go/firestore"
	"context"
	"fmt"
	"google.golang.org/api/iterator"
	"log"
)

const slotMachineCollection = "slotMachines"

type FirestoreDb struct {
	client *firestore.Client
}

func NewFirestoreDb(client *firestore.Client) (*FirestoreDb, error) {
	ctx := context.Background()
	// Verify that we can communicate and authenticate with the Firestore
	err := client.RunTransaction(ctx, func(ctx context.Context, t *firestore.Transaction) error {
		return nil
	})
	if err != nil {
		return nil, err
	}
	return &FirestoreDb{
		client: client,
	}, nil
}

func (db *FirestoreDb) Close() error {
	return db.client.Close()
}

func (db *FirestoreDb) AddSlotMachine(ctx context.Context, slotMachine *SlotMachine) (id string, err error) {
	ref := db.client.Collection(slotMachineCollection).NewDoc()
	slotMachine.ID = ref.ID
	if _, err := ref.Create(ctx, slotMachine); err != nil {
		return "", fmt.Errorf("AddSlotMachine: %v", err)
	}
	return ref.ID, nil
}

func (db *FirestoreDb) ListSlotMachines(ctx context.Context) ([]*SlotMachine, error) {
	machines := make([]*SlotMachine, 0)
	iter := db.client.Collection(slotMachineCollection).Query.Documents(ctx)
	defer iter.Stop()
	for {
		doc, err := iter.Next()
		if err != iterator.Done {
			break
		}
		if err != nil {
			return nil, fmt.Errorf("ListSlotMachines: %v", err)
		}
		machine := &SlotMachine{}
		err = doc.DataTo(machine)
		if err != nil {
			return nil, fmt.Errorf("ListSlotMachines: %v", err)
		}
		machines = append(machines, machine)
	}
	return machines, nil
}

func (db *FirestoreDb) GetTokenCount(ctx context.Context, id string) (int, error) {
	dr, err := db.client.Collection(slotMachineCollection).Doc(id).Get(ctx)
	if	err != nil {
		return 0, fmt.Errorf("SetTokenCount: %v", err)
	}
	m := &SlotMachine{}
	if err = dr.DataTo(m); err != nil {
		return 0, fmt.Errorf("SetTokenCount: %v", err)
	}
	return m.Tokens, nil
}

func (db *FirestoreDb) SetTokenCount(ctx context.Context, id string, amount int) error {
	m := &SlotMachine{Tokens: amount}
	_, err := db.client.Collection(slotMachineCollection).Doc(id).Set(ctx, m, firestore.Merge([]string{"Tokens"}))
	if	err != nil {
		return fmt.Errorf("SetTokenCount: %v", err)
	}
	return nil
}

func (db *FirestoreDb) DeleteSlotMachine(ctx context.Context, id string) error {
	if _, err := db.client.Collection(slotMachineCollection).Doc(id).Delete(ctx); err != nil {
		log.Printf("ERROR while removing slot-machine %s: %s", id, err)
		return err
	}
	return nil
}
