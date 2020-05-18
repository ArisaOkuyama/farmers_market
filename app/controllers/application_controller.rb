class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  

  protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:first_name, :last_name, :state, :address, :phone])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :state, :address, :phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:state, :address, :phone, :users_picture])
  end
end
