package models

import "github.com/jinzhu/gorm"

type Room struct {
	gorm.Model
	Id         uint     `json:"room_id"`
	HotelId    uint     `json:"-"`
	Hotel      Hotel    `json:"-"`
	RoomTypeId uint     `json:"-"`
	Prices     []Price  `json:"price" gorm:"foreignKey:RoomTypeId;references:RoomTypeId"`
	RoomType   RoomType `json:"-"`
	RoomNumber int      `json:"room_number"`
	RoomStatus string   `json:"-"`
}
