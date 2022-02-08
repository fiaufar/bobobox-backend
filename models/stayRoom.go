package models

import "github.com/jinzhu/gorm"

type StayRoom struct {
	gorm.Model
	Id     uint
	StayId uint
	Stay   Stay
	RoomId uint
	Room   Room
	Date   string
}
