class Attention < ApplicationRecord
 	belongs_to :user, foreign_key: 'user_id'
	belongs_to :pet,  foreign_key: 'pet_id'
	belongs_to :hour_reservation,  foreign_key: 'hour_id'

end
