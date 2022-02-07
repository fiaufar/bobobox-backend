package config

import (
	"github.com/gin-gonic/gin"
	"github.com/jinzhu/gorm"
)

func InitRouter(db *gorm.DB) *gin.Engine {
	router := gin.Default()
	
	return router
}
