package models

import "github.com/jinzhu/gorm"

type Stay struct {
	gorm.Model
	Id            uint
	ReservationId uint
	Reservation   Reservation `gorm:"foreignKey:ReservationId"`
	GuestName     string
	RoomId        uint
	Room          Room
}
