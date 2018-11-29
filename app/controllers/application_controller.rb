class ApplicationController < ActionController::Base
protect_from_forgery with: :exception 
before_action :authenticate_user!, except: [:inicio, :about, :contact]
before_action :permitted_parameters, if: :devise_controller?
def inicio
end
def about
end
def contact
end
private

  # If you have extra params to permit, append them to the sanitizer.

  def permitted_parameters
  added_attrs = [:email, :password, :password_confirmation,:nombre, :ap_pat,:ap_mat,:rut,:direccion,:celular,:rol,:comuna ]
  devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end



  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #  super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
