package routes

import (
	"github.com/gofiber/fiber/v2"
	"github.com/rabarbra/speakpractice_club/api/handlers"
	"github.com/rabarbra/speakpractice_club/pkg/account"
)

func AccountRouter(app fiber.Router, service account.Service) {
	app.Get("/accounts", handlers.GetAccounts(service))
	app.Post("/accounts", handlers.AddAccount(service))
	// app.Put("/accounts", handlers.UpdateAccount(service))
	// app.Delete("/accounts", handlers.RemoveAccount(service))
}
