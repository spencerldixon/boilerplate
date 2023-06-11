class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, unless: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :terms_and_conditions])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  def require_turbo_frame_request
    head :unauthorized unless turbo_frame_request?
  end
end
