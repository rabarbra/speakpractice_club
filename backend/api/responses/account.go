package responses

import (
	"github.com/gofiber/fiber"
	"github.com/rabarbra/speakpractice_club/pkg/entities"
	"go.mongodb.org/mongo-driver/bson/primitive"
)

type Account struct {
	ID     primitive.ObjectID `json:"id" bson:"_id,omitempty"`
	Title  string             `json:"title"`
	Author string             `json:"author"`
}

func AccountSuccessResponse(data *entities.Account) *fiber.Map {
	account := Account{
		ID:     data.ID,
		Title:  data.Title,
		Author: data.Author,
	}
	return &fiber.Map{
		"status": true,
		"data":   account,
		"error":  nil,
	}
}

// AccountsSuccessResponse is the list SuccessResponse that will be passed in the response by Handler
func AccountsSuccessResponse(data *[]Account) *fiber.Map {
	return &fiber.Map{
		"status": true,
		"data":   data,
		"error":  nil,
	}
}

// AccountErrorResponse is the ErrorResponse that will be passed in the response by Handler
func AccountErrorResponse(err error) *fiber.Map {
	return &fiber.Map{
		"status": false,
		"data":   "",
		"error":  err.Error(),
	}
}
