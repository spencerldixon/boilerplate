class OnboardingController < ApplicationController
  before_action :require_turbo_frame_request

  def index
    session[:onboarding] = nil # Remove modal as soon as the first screen has been seen by the user
  end

  def confirm_email
  end

  def organisation
  end
end
