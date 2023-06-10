class ApplicationMailer < ActionMailer::Base
  default from: ENV["NOREPLY_EMAIL"]

  layout "mailer"
end
