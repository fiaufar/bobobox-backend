package models

import "github.com/jinzhu/gorm"

type RoomType struct {
	gorm.Model
	Id   uint
	Name string
}
