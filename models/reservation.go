package models

import "github.com/jinzhu/gorm"

type Reservation struct {
	gorm.Model
	Id              uint
	OrderId         uint
	CustomerName    string
	BookedRoomCount int
	CheckinDate     string
	CheckoutDate    string
	HotelId         uint
	Hotel           Hotel
}
