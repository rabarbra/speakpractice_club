package main

import (
	"context"
	"fmt"
	"log"
	"time"

	"github.com/rabarbra/speakpractice_club/api/routes"
	"github.com/rabarbra/speakpractice_club/pkg/account"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/cors"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

func main() {
	db, cancel, err := databaseConnection()
	if err != nil {
		log.Fatal("Database Connection Error $s", err)
	}
	fmt.Println("Database connection success!")
	accountCollection := db.Collection("accounts")
	accountRepo := account.NewRepo(accountCollection)
	accountService := account.NewService(accountRepo)

	app := fiber.New()
	app.Use(cors.New())
	app.Get("/", func(ctx *fiber.Ctx) error {
		return ctx.Send([]byte("Welcome to the language club api!"))
	})
	api := app.Group("/api")
	routes.AccountRouter(api, accountService)
	defer cancel()
	log.Fatal(app.Listen(":8080"))
}

func databaseConnection() (*mongo.Database, context.CancelFunc, error) {
	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	client, err := mongo.Connect(ctx, options.Client().ApplyURI(
		"mongodb://username:password@localhost:27017/fiber").SetServerSelectionTimeout(5*time.
		Second))
	if err != nil {
		cancel()
		return nil, nil, err
	}
	db := client.Database("accounts")
	return db, cancel, nil
}
