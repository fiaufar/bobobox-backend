package services

import (
	"assignment/models"
	"fmt"
	"github.com/jinzhu/gorm"
	"strings"
	"time"
)

var DB *gorm.DB

// CalculatePromo Function for calculate Promo Price
func CalculatePromo(db *gorm.DB, rooms []models.Room, totalPrice int, promoId uint) ([]models.Room, int) {
	DB = db
	fmt.Println("CALCULATE PROMO")
	var (
		promo              models.Promo
		checkinDate        string
		nightCount         int           = 0
		roomsDiscount      []models.Room = rooms
		totalPriceDiscount int           = totalPrice
	)
	DB.Where("ID = ?", promoId).First(&promo)
	if promo == (models.Promo{}) {
		fmt.Println("PROMO = PROMO{}")
		return rooms, totalPrice
	}

	for idx, room := range rooms {
		if len(room.Prices) < 1 {
			continue
		}

		bookNightCount := len(room.Prices) - 1
		if nightCount < bookNightCount {
			nightCount = bookNightCount
		}
		checkinDate = room.Prices[0].Date
		if !CheckPromoQuota(promo, room.Prices[0].Date) {
			return rooms, totalPrice
		}

		for i, price := range roomsDiscount[idx].Prices {
			if promo.Currency != 0 {
				price.Price -= promo.Currency
			} else if promo.Percentage != 0 {
				price.Price -= price.Price * promo.Percentage / 100
			}

			if i == 0 {
				totalPriceDiscount = price.Price
			}
		}
	}

	if CheckPromoRules(promo, nightCount, len(rooms), checkinDate) {
		fmt.Println("RETURN DISCOUNT")
		return roomsDiscount, totalPriceDiscount
	} else {
		fmt.Println("RETURN NON DISCOUNT")
		return rooms, totalPrice
	}
}

// CheckPromoQuota Function for Check the Promo's Quota available
func CheckPromoQuota(promo models.Promo, date string) bool {
	var stays []models.Reservation
	DB.Where("checkin_date <= ? AND checkout_date >= ?", date, date).Find(&stays)
	count := len(stays)

	if count >= promo.PromoQuota {
		fmt.Println("RETURN FALSE CHECK PROMO QUOTA")
		return false
	}

	fmt.Println("RETURN TRUE CHECK PROMO QUOTA")
	return true
}

//CheckPromoRules Function to check the promo Rules
func CheckPromoRules(promo models.Promo, night int, room int, checkin string) bool {
	checkinDate, _ := time.Parse("01-01-2001", checkin)
	currTimestamp := time.Now()
	bookingHourStart := time.Date(currTimestamp.Year(), currTimestamp.Month(), currTimestamp.Day(), promo.BookingHourStart, 0, 0, 0, currTimestamp.Location())
	bookingHourEnd := time.Date(currTimestamp.Year(), currTimestamp.Month(), currTimestamp.Day(), promo.BookingHourEnd, 0, 0, 0, currTimestamp.Location())

	if !strings.Contains(promo.CheckinDay, checkinDate.Weekday().String()) || promo.MinimumNight > night || promo.MinimumRoom > room {
		fmt.Println("!strings.Contains(promo.CheckinDay, string(checkinDate.Weekday())) || promo.MinimumNight > night || promo.MinimumRoom > room")
		return false
	}

	fmt.Println(bookingHourStart, currTimestamp.Before(bookingHourStart), bookingHourEnd, currTimestamp.After(bookingHourEnd), !strings.Contains(promo.BookingDay, currTimestamp.Weekday().String()))
	if currTimestamp.Before(bookingHourStart) || currTimestamp.After(bookingHourEnd) || !strings.Contains(promo.BookingDay, currTimestamp.Weekday().String()) {
		fmt.Println("currTimestamp.Before(bookingHourStart) || currTimestamp.After(bookingHourEnd) || !strings.Contains(promo.BookingDay, string(currTimestamp.Weekday()))")
		return false
	}

	fmt.Println("CHECK RULES TRUE")
	return true
}
