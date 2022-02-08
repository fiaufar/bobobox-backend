package main

import (
	"assignment/config"
	"github.com/jinzhu/gorm"
)

func main() {
	db := config.InitDB()
	router := config.InitRouter(db)

	router.Run(":8000")
}

func getDBConnection() *gorm.DB {
	return config.InitDB()
}
