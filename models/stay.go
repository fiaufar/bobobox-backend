package models

import "github.com/jinzhu/gorm"

type Stay struct {
	gorm.Model
	Id            uint
	ReservationId uint
	Reservation   Reservation
	GuestName     string
	RoomId        uint
	Room          Room
}
