package models

import "github.com/jinzhu/gorm"

type Promo struct {
	gorm.Model
	Id               uint
	Percentage       int
	Currency         int
	MinimumNight     int
	MinimumRoom      int
	PromoQuota       int
	CheckinDay       string
	BookingDay       string
	BookingHourStart int
	BookingHourEnd   int
}
