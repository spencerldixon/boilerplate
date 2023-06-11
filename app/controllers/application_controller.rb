class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, unless: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :terms_and_conditions])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  def require_admin
    return if current_user.admin?
    redirect_to root_path, notice: "You must be an admin to access this resource"
  end

  def after_sign_up_path_for(resource)
    session[:onboarding] = true
    root_path
  end
end
