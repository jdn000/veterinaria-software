class Attention < ApplicationRecord
 	belongs_to :user, foreign_key: 'user_id'
	validates  :descripcion, length: { in: 2..50 , :message => " Descripcion  tiene que estar entre 2 a 50 caracteres"}, allow_blank: false
	validates  :mascota, presence: { message: "Seleccione mascota" }
end

 