package controllers

import (
	"assignment/models"
	"assignment/services"
	"assignment/structs"
	"encoding/json"
	"github.com/gin-gonic/gin"
	"io/ioutil"
	"net/http"
)

func (db *InDB) GetRoomAvailable(c *gin.Context) {
	var (
		data   []models.Room
		result gin.H
	)

	checkinDate := c.Query("checkin_date")
	checkoutDate := c.Query("checkout_date")
	roomQty := c.Query("room_qty")
	roomTypeId := c.Query("room_type_id")

	err := db.DB.Preload("Prices", "date IN (?)", []string{checkinDate, checkoutDate}).Where("room_status = 'available'").Where("room_type_id = ?", roomTypeId).Find(&data).Error
	totalPrice := 0
	if len(data) > 0 && len(data[0].Prices) > 0 {
		totalPrice = data[0].Prices[0].Price
	}

	if err != nil {
		result = gin.H{
			"available_room": err.Error(),
			"total_price":    0,
			"checkout_date":  checkoutDate,
			"checkin_date":   checkinDate,
			"room_type_id":   roomTypeId,
			"room_qty":       roomQty,
		}
	} else {
		result = gin.H{
			"available_room": data,
			"total_price":    totalPrice,
			"checkout_date":  checkoutDate,
			"checkin_date":   checkinDate,
			"room_type_id":   roomTypeId,
			"room_qty":       roomQty,
		}
	}

	c.JSON(http.StatusOK, result)
}

func (db *InDB) CheckPromo(c *gin.Context) {
	var (
		requestData structs.PromoRequest
		result      gin.H
	)

	jsonData, err := ioutil.ReadAll(c.Request.Body)
	json.Unmarshal([]byte(string(jsonData)), &requestData)

	requestData.Room, requestData.TotalPrice = services.CalculatePromo(db.DB, requestData.Room, requestData.TotalPrice, requestData.PromoId)

	if err != nil {
		result = gin.H{
			"result": err.Error(),
		}
	} else {
		result = gin.H{
			"result": requestData,
		}
	}

	c.JSON(http.StatusOK, result)
}
