class Product < ApplicationRecord
  belongs_to :provider

  before_save :minimizando_entradas
  
  VALID_NAME_REGEX = /(?=^.{2,50}$)[a-zA-ZñÑáéíóúÁÉÍÓÚ]+(\s[a-zA-ZñÑáéíóúÁÉÍÓÚ]+)?/
  
  validates :nombre_producto, length: { in: 2..50 , :message => " El nombre tiene que estar entre 2 a 50 caracteres"}, format: { with: VALID_NAME_REGEX , :message => "El nombre no tiene formato valido"}, presence: { message: "no puede estar en blanco" }
  validates :tipo_producto, length: { in: 2..50 , :message => " El tipo de producto tiene que estar entre 2 a 50 caracteres"}, format: { with: VALID_NAME_REGEX , :message => "El tipo de producto no tiene formato valido"}, presence: { message: "no puede estar en blanco" }
  validates :descripcion, length: { in: 2..50 , :message => " La descripcion tiene que estar entre 2 a 50 caracteres"}, format: { with: VALID_NAME_REGEX , :message => "La descripcion no tiene formato valido"}, presence: { message: "no puede estar en blanco" }
 
  private
  def minimizando_entradas
    self.nombre_producto= nombre_producto.downcase
    self.tipo_producto= tipo_producto.downcase
    self.descripcion= descripcion.downcase

   end

 end
