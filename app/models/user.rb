class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 has_many :hour_reservation
 has_many :pet

  include RunCl::ActAsRun
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates  :rut, presence: true, uniqueness: true
  has_run_cl :rut       
  before_save :minimizando_entradas
    

  VALID_NAME_REGEX = /(?=^.{2,50}$)[a-zA-ZñÑáéíóúÁÉÍÓÚ]+(\s[a-zA-ZñÑáéíóúÁÉÍÓÚ]+)?/
  validates :nombre, length: { in: 2..50 , :message => " El nombre tiene que estar entre 2 a 50 caracteres"}, format: { with: VALID_NAME_REGEX , :message => "El nombre no tiene formato valido"}, presence: { message: "no puede estar en blanco" }
  validates :ap_pat, length: { in: 2..50 , :message => " El apellido tiene que estar entre 2 a 50 caracteres"}, format: { with: VALID_NAME_REGEX , :message => "El apellido no tiene formato valido"}, presence: { message: "no puede estar en blanco" }
  validates :ap_mat, length: { in: 2..50 , :message => " El apellido tiene que estar entre 2 a 50 caracteres"}, format: { with: VALID_NAME_REGEX , :message => "El apellido no tiene formato valido"}, presence: { message: "no puede estar en blanco" }
  VALID_EMAIL_REGEX = /[a-z0-9]+[_a-z0-9.-][a-z0-9]+@[a-z0-9-]+(.[a-z0-9-]+)(.[a-z]{2,4})/
  validates :email, format: { with: VALID_EMAIL_REGEX , message: "es invalido" }, confirmation: { case_sensitive: false }, uniqueness: { message: "Ya existe" }, length: { in: 7..254 , :message => " El correo debe estar los 7 a 254 caracteres"}, presence: { message: "no puede estar en blanco" }
  validates :direccion, length: { in: 10..254 , :message => " La direccion debe estar los 10 a 254 caracteres"}, presence: { message: "no puede estar en blanco" }
 private
 def minimizando_entradas
  self.nombre= nombre.downcase
  self.ap_pat= ap_pat.downcase
  self.ap_mat= ap_mat.downcase
  self.direccion= direccion.downcase
 end

end       