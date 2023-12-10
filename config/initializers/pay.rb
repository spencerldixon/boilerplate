Pay.setup do |config|
  # https://github.com/pay-rails/pay/blob/master/docs/2_configuration.md

  # Let Stripe handle sending the emails
  config.send_emails = false
end
