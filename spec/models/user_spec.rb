require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it "is valid" do
    expect(user).to be_valid
  end

  describe "validations" do
    it "requires a first_name" do
      user.first_name = nil

      expect(user).not_to be_valid
    end

    it "requires a last_name" do
      user.last_name = nil

      expect(user).not_to be_valid
    end

    it "requires an email" do
      user.email = nil

      expect(user).not_to be_valid
    end

    it "requires a password greater than 7 characters" do
      user.password = "1234567"
      user.password_confirmation = "1234567"

      expect(user).not_to be_valid
    end

    it "requires an uncommon password" do
      user.password = "password1234"
      user.password_confirmation = "password1234"

      expect(user).not_to be_valid
    end

    it "requires terms_and_conditions to be accepted" do
      user.terms_and_conditions = nil

      expect(user).not_to be_valid
    end
  end
end
