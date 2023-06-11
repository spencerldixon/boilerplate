require "rails_helper"

RSpec.describe "Registration", type: :system do
  let(:user) { build(:user) }

  context "with valid info" do
    before do
      visit new_user_registration_path
      fill_in "First name", with: user.first_name
      fill_in "Last name", with: user.last_name
      fill_in "Email address", with: user.email
      fill_in "Password", with: user.password
      fill_in "Password confirmation", with: user.password
    end

    context "without accepting the terms and conditions" do
      it "raises an error" do
        click_button "Register"

        expect(current_path).to eq(user_registration_path)
        expect(page).to have_content("Terms and conditions must be accepted")
      end
    end

    context "with accepting the terms and conditions" do
      subject(:sign_up) do
        check "user_terms_and_conditions"
        click_button "Register"
      end

      it "registers user successfully" do
        sign_up
        expect(current_path).to eq(authenticated_root_path)
      end

      it "renders a flash message" do
        sign_up
        expect(page).to have_content("You have signed up successfully")
      end

      it "sends a confirmation email" do
        expect { sign_up }.to have_enqueued_mail(Devise::Mailer, :confirmation_instructions).with(User.first)
      end
    end
  end

  context "with invalid info" do
    it "raises an error" do
      visit new_user_registration_path
      fill_in "Last name", with: user.last_name
      fill_in "Email address", with: user.email
      fill_in "Password", with: user.password
      fill_in "Password confirmation", with: user.password
      check "user_terms_and_conditions"
      click_button "Register"

      expect(page).not_to have_content("Log out")
      expect(current_path).to eq(user_registration_path)
      expect(page).to have_content("First name can't be blank")
    end
  end
end
