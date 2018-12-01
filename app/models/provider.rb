class Provider < ApplicationRecord		
	has_many :products, dependent: :destroy
  validates :nombre_proveedor, presence: true,
                    length: { minimum: 5 }
end
