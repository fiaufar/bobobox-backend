package config

import (
	"assignment/models"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
)

func InitDB() *gorm.DB {
	dbName := "bobobox_assignment"
	user := "root"
	password := ""
	host := "localhost"
	port := "3306"

	db, err := gorm.Open("mysql", user+":"+password+"@tcp("+host+":"+port+")/"+dbName+"?charset=utf8&parseTime=True&loc=Local")
	if err != nil {
		panic("Failed to connect to database")
	}

	migration(db)
	return db
}

func migration(db *gorm.DB) {
	db.AutoMigrate(models.Hotel{})
	db.AutoMigrate(models.Room{})
	db.AutoMigrate(models.RoomType{})
	db.AutoMigrate(models.Reservation{})
	db.AutoMigrate(models.Stay{})
	db.AutoMigrate(models.StayRoom{})
	db.AutoMigrate(models.Price{})
}
