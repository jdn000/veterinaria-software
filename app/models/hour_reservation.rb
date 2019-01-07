class HourReservation < ApplicationRecord
	has_many :attentions
include Holidays
	belongs_to :user, foreign_key: 'user_id'
	belongs_to :pet,  foreign_key: 'pet_id'

end
