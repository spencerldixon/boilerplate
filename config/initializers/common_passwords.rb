COMMON_PASSWORDS = File.readlines("lib/common_passwords.txt", chomp: true).reject { |password|
  password.length < Devise.password_length.min
}.freeze
