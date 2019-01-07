class Pet < ApplicationRecord
	validates :nombre,:tipo_mascota,:sexo,:raza,length: { in: 2..50 }
	has_many :hour_reservations
	has_many :users ,through: :hour_reservations
	has_many :attentions
	has_many :users ,through: :attentions
	belongs_to :user, required: false
end
