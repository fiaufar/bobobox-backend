package models

import "github.com/jinzhu/gorm"

type Hotel struct {
	gorm.Model
	Id        uint
	HotelName string
	Address   string
}
