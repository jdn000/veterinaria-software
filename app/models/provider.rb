
  

class Provider < ApplicationRecord	

  include RunCl::ActAsRun
  validates  :rut, presence: true, uniqueness: true
  has_run_cl :rut       
  before_save :minimizando_entradas


	has_many :products, dependent: :destroy
	validates_associated :products
	validates :nombre_proveedor, :rut, presence: true

  def minimizando_entradas
    self.nombre_proveedor= nombre_proveedor.downcase

   end



end
