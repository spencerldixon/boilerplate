class Users::RegistrationsController < Devise::RegistrationsController
  private

  def after_sign_up_path_for(resource)
    session[:onboarding] = true
    root_path
  end
end
