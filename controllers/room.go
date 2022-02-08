package controllers

import (
	"assignment/models"
	"fmt"
	"github.com/gin-gonic/gin"
	"net/http"
)

func (db *InDB) GetRoomAvailable(c *gin.Context) {
	var (
		person []models.Room
		result gin.H
	)
	//maps := c.Request.URL.Query()
	//fmt.Println(maps)
	//fmt.Println(maps["id"][0])

	//str := ""
	//for _, value := range maps {
	//	str = str + value
	//}
	checkinDate := c.Query("checkin_date")
	checkoutDate := c.Query("checkout_date")
	roomQty := c.Query("room_qty")
	roomTypeId := c.Query("room_type_id")
	fmt.Println(checkinDate)
	fmt.Println(checkoutDate)
	fmt.Println(roomQty)
	fmt.Println(roomTypeId)
	//err := db.DB.Where("id = ?", id).First(&person).Error
	//err := db.DB.Raw("SELECT * FROM rooms").Scan(&person).Error
	err := db.DB.Preload("Prices", "date IN (?)", []string{checkinDate, checkoutDate}).Where("room_status = 'available'").Where("room_type_id = ?", roomTypeId).Find(&person).Error
	//fmt.Println(person)
	if err != nil {
		result = gin.H{
			"result": err.Error(),
			"count":  0,
		}
	} else {
		result = gin.H{
			"result": person,
			"count":  len(person),
		}
	}

	c.JSON(http.StatusOK, result)
}
