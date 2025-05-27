package account

import (
	"github.com/rabarbra/speakpractice_club/api/responses"
	"github.com/rabarbra/speakpractice_club/pkg/entities"
)

type Service interface {
	InsertAccount(account *entities.Account) (*entities.Account, error)
	FetchAccounts() (*[]responses.Account, error)
	UpdateAccount(account *entities.Account) (*entities.Account, error)
	RemoveAccount(ID string) error
}

type service struct {
	repository Repository
}

// NewService is used to create a single instance of the service
func NewService(r Repository) Service {
	return &service{
		repository: r,
	}
}

func (r *service) InsertAccount(account *entities.Account) (*entities.Account, error) {
	return nil, nil
}

func (r *service) FetchAccounts() (*[]responses.Account, error) {
	return nil, nil
}

func (r *service) UpdateAccount(account *entities.Account) (*entities.Account, error) {
	return nil, nil
}

func (r *service) RemoveAccount(ID string) error {
	return nil
}
