class Pet < ApplicationRecord
	validates :nombre,:tipo_mascota,:sexo,:raza,length: { in: 2..50 }
	has_many :hour_reservation
	belongs_to :user, required: false
end
