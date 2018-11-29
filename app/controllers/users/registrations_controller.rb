# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
   before_action :sign_up_params, only: [:create]
   #before_action :configure_account_update_params, only: [:update]
  # before_action :sign_up_params, if: :devise_controller?

 #  GET /resource/sign_up
 #  def new
#     @user=User.new
 #  end

  # POST /resource
  # def create
  #   @user=User.new(permitted_parameters)
  #   if @user.save
    #  redirect_to root_url
 #   else
 ##     render 'new'
 #   end
 #  end

  # GET /resource/edit
 #  def edit
 #   super
 #  end

  # PUT /resource
 #  def update
 #    super
 #  end

  # DELETE /resource
#   def destroy
   # super
  #end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

private

  # If you have extra params to permit, append them to the sanitizer.

  #def permitted_parameters
#  devise_parameter_sanitizer.permit(:sign_in) do |user_params|
   # user_params.permit( :email,:password,:nombre, :ap_pat,:ap_mat,:rut,:direccion,:celular)
 # end
 # end
#
    # Modified Devise params for user login
    def sign_up_params
      params.require(:user).permit( :email,:password,:nombre, :ap_pat,:ap_mat,:rut,:direccion,:celular,:rol,:comuna)
    end

  # The path used after sign up.
 #  def after_sign_up_path_for(resource)
 #   super(resource)
 #  end

  # The path used after sign up for inactive accounts.
 #  def after_inactive_sign_up_path_for(resource)
 #    super(resource)
 #  end
end
