class ApplicationController < ActionController::Base  
protect_from_forgery with: :exception 
before_action :authenticate_user!, except: [:inicio, :about, :contact]
before_action :permitted_parameters, if: :devise_controller?
before_action :require_activated,except: [:inicio, :about, :contact]
def inicio
  @empleados=User.where("role = ? OR role = ? OR role = ? AND activado = ?",'trabajador','peluquero','veterinario', true)
  @clientes=User.where(role: 'cliente')
  #@horas=HourReservation.where(" fecha_reserva between ? AND ? ", Date.today.prev_month, Date.today+1.month)
end
def about
end
def contact
end

private

  # If you have extra params to permit, append them to the sanitizer.

def permitted_parameters
          added_attrs = [:email, :password, :password_confirmation,:nombre, :ap_pat,:ap_mat,:rut,:direccion,:celular,:role,:comuna ]
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
    def require_activated
      if current_user != nil
       if !current_user.activado?        
         sign_out_and_redirect(current_user)
         flash[:error]="Usuario no existe [401]"
       end     
      end
    end   
end
