package handlers

import (
	"errors"
	"net/http"

	"github.com/gofiber/fiber/v2"
	"github.com/rabarbra/speakpractice_club/api/responses"
	"github.com/rabarbra/speakpractice_club/pkg/account"
	"github.com/rabarbra/speakpractice_club/pkg/entities"
)

func AddAccount(service account.Service) fiber.Handler {
	return func(c *fiber.Ctx) error {
		var requestBody entities.Account
		err := c.BodyParser(&requestBody)
		if err != nil {
			c.Status(http.StatusBadRequest)
			return c.JSON(responses.AccountErrorResponse(err))
		}
		if requestBody.Author == "" || requestBody.Title == "" {
			c.Status(http.StatusInternalServerError)
			return c.JSON(responses.AccountErrorResponse(errors.New(
				"Please specify title and author")))
		}
		result, err := service.InsertAccount(&requestBody)
		if err != nil {
			c.Status(http.StatusInternalServerError)
			return c.JSON(responses.AccountErrorResponse(err))
		}
		return c.JSON(responses.AccountSuccessResponse(result))
	}
}

func GetAccounts(service account.Service) fiber.Handler {
	return func(c *fiber.Ctx) error {
		fetched, err := service.FetchAccounts()
		if err != nil {
			c.Status(http.StatusInternalServerError)
			return c.JSON(responses.AccountErrorResponse(err))
		}
		return c.JSON(responses.AccountsSuccessResponse(fetched))
	}
}
