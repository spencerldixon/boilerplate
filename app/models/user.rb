class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :confirmable, :lockable, :trackable

  attr_accessor :terms_and_conditions

  validates :first_name, :last_name, presence: true
  validates_acceptance_of :terms_and_conditions, allow_nil: false, on: :create
  validate :uncommon_password

  private

  def uncommon_password
    # Checks password against a wordlist of common passwords
    return if password.blank?

    if COMMON_PASSWORDS.include?(password)
      errors.add(:password, "Cannot be a common password")
    end
  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later(queue: :devise)
  end
end
