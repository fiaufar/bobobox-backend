package main

import (
	"assignment/config"
)

func main() {
	db := config.InitDB()
	router := config.InitRouter(db)

	router.Run(":8000")
}
