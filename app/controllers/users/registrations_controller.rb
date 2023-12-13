class Users::RegistrationsController < Devise::RegistrationsController
  def destroy
    # Attempt to cancel subscription (if one exists) on account deletion
    subscription = resource.payment_processor.subscription
    subscription.cancel_now! if subscription

    # Destroy the user as normal
    super
  end

  private

  def after_sign_up_path_for(resource)
    session[:onboarding] = true
    root_path
  end
end
