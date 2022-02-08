package config

import (
	"assignment/controllers"
	"github.com/gin-gonic/gin"
	"github.com/jinzhu/gorm"
)

func InitRouter(db *gorm.DB) *gin.Engine {
	router := gin.Default()
	inDb := &controllers.InDB{
		DB: db,
	}

	router.GET("/room", inDb.GetRoomAvailable)
	return router
}
