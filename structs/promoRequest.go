package structs

import "assignment/models"

type PromoRequest struct {
	Room       []models.Room
	TotalPrice int  `json:"total_price"`
	PromoId    uint `json:"promo_id"`
}
