package main

import (
	"cloud.google.com/go/firestore"
	"cloud.google.com/go/logging"
	"context"
	"fmt"
	"google.golang.org/api/iterator"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"time"
)

const slotMachineCollection = "slotMachines"

type FirestoreDb struct {
	client *firestore.Client
	logger *logging.Logger
}

func NewFirestoreDb(client *firestore.Client, logger *logging.Logger) (*FirestoreDb, error) {
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
		logger: logger,
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
	iter := db.client.Collection(slotMachineCollection).Documents(ctx)
	defer iter.Stop()
	for {
		doc, err := iter.Next()
		if err == iterator.Done {
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
	if err != nil {
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
	if err != nil {
		return fmt.Errorf("SetTokenCount: %v", err)
	}
	return nil
}

func (db *FirestoreDb) DeleteSlotMachine(ctx context.Context, id string) error {
	_, err := db.client.Collection(slotMachineCollection).Doc(id).Delete(ctx)
	return err
}

func (db *FirestoreDb) ListenToSlotMachineChanges(ctx context.Context, f func(machine SlotMachine)) (cancel func(), err error) {
	ctx, c := context.WithTimeout(ctx, 30*time.Second)
	defer c()

	shouldCancel := false
	cancel = func() { shouldCancel = true }

	go func() {

		it := db.client.Collection(slotMachineCollection).Snapshots(ctx)
		for !shouldCancel {
			snap, err := it.Next()
			if status.Code(err) == codes.DeadlineExceeded {
				return
			}
			if err != nil {
				db.logger.StandardLogger(logging.Error).Printf("Snapshot.Next: %v", err)
				return
			}
			if snap != nil {
				for !shouldCancel {
					doc, err := snap.Documents.Next()
					if err == iterator.Done {
						break
					}
					if err != nil {
						db.logger.StandardLogger(logging.Error).Printf("Documents.Next: %v", err)
						return
					}
					m := SlotMachine{}
					err = doc.DataTo(&m)
					if err == nil {
						f(m)
					}
				}
			}
		}
	}()

	return cancel, nil
}
