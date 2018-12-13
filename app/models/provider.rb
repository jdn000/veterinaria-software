
class Provider < ApplicationRecord	

  include RunCl::ActAsRun
  validates  :rut, presence: true, uniqueness: true
  has_run_cl :rut 
        
  before_save :minimizando_entradas


	has_many :products
	validates_associated :products

  VALID_NAME_REGEX = /(?=^.{2,50}$)[a-zA-ZñÑáéíóúÁÉÍÓÚ]+(\s[a-zA-ZñÑáéíóúÁÉÍÓÚ]+)?/
  
  validates :nombre_proveedor, length: { in: 2..50 , :message => " El nombre tiene que estar entre 2 a 50 caracteres"}, format: { with: VALID_NAME_REGEX , :message => "El nombre no tiene formato valido"}, presence: { message: "no puede estar en blanco" }, uniqueness: true
  validates :razon_social, length: { in: 2..50 , :message => " La razon social tiene que estar entre 2 a 50 caracteres"}, format: { with: VALID_NAME_REGEX , :message => "La razon social no tiene formato valido"}, presence: { message: "no puede estar en blanco" }
  validates :direccion, length: { in: 2..50 , :message => " La direccion tiene que estar entre 2 a 50 caracteres"}, format: { with: VALID_NAME_REGEX , :message => "La direccion no tiene formato valido"}, presence: { message: "no puede estar en blanco" }
  validates :giro, length: { in: 2..50 , :message => " El giro tiene que estar entre 2 a 50 caracteres"}, format: { with: VALID_NAME_REGEX , :message => "El giro no tiene formato valido"}, presence: { message: "no puede estar en blanco" }
  
  VALID_EMAIL_REGEX = /[a-z0-9]+[_a-z0-9.-][a-z0-9]+@[a-z0-9-]+(.[a-z0-9-]+)(.[a-z]{2,4})/
  validates :email, format: { with: VALID_EMAIL_REGEX , message: "es invalido" }, confirmation: { case_sensitive: false }, uniqueness: { message: "Ya existe" }, length: { in: 7..254 , :message => " El correo debe estar los 7 a 254 caracteres"}, presence: { message: "no puede estar en blanco" }, uniqueness: true
  
  validates :fono ,presence:true,length: { in: 2..50 }, uniqueness: true

  private
  def minimizando_entradas
    self.nombre_proveedor= nombre_proveedor.downcase
    self.razon_social= razon_social.downcase
    self.direccion= direccion.downcase
    self.giro= giro.downcase

   end

end