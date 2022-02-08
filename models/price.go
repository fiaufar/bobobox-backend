package models

import "github.com/jinzhu/gorm"

type Price struct {
	gorm.Model
	Id         uint     `json:"-"`
	Date       string   `json:"date"`
	RoomTypeId uint     `json:"-"`
	RoomType   RoomType `json:"-"`
	Price      int      `json:"price"`
}
