package account

import (
	"context"
	"time"

	"github.com/rabarbra/speakpractice_club/api/responses"
	"github.com/rabarbra/speakpractice_club/pkg/entities"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"go.mongodb.org/mongo-driver/mongo"
)

type Repository interface {
	CreateAccount(acc *entities.Account) (*entities.Account, error)
	ReadAccount() (*[]responses.Account, error)
	UpdateAccout(account *entities.Account) (*entities.Account, error)
	DeleteAccount(ID string) error
}
type repository struct {
	Collection *mongo.Collection
}

// NewRepo is the single instance repo that is being created.
func NewRepo(collection *mongo.Collection) Repository {
	return &repository{
		Collection: collection,
	}
}

func (r *repository) CreateAccount(account *entities.Account) (*entities.Account, error) {
	account.ID = primitive.NewObjectID()
	account.CreatedAt = time.Now()
	account.UpdatedAt = time.Now()
	_, err := r.Collection.InsertOne(context.Background(), account)
	if err != nil {
		return nil, err
	}
	return account, nil
}

func (r *repository) ReadAccount() (*[]responses.Account, error) {
	return nil, nil
}

func (r *repository) UpdateAccout(account *entities.Account) (*entities.Account, error) {
	return nil, nil
}

func (r *repository) DeleteAccount(ID string) error {
	return nil
}
