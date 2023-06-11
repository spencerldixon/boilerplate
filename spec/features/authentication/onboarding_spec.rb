require "rails_helper"

RSpec.describe "Onboarding", type: :system, js: true do
  let(:user) { build(:user) }

  describe "when logged in for the first time" do
    before do
      visit new_user_registration_path
      sign_up_with_capybara(user)
    end

    it "displays onboarding modal" do
      expect(page).to have_content("Welcome to Boilerplate")
    end

    it "can be dismissed" do
      expect(page).to have_content("Welcome to Boilerplate")
      find("#close_modal").click
      expect(page).not_to have_content("Welcome to Boilerplate")
    end

    context "subsequent page visits" do
      before { refresh }

      it "does not display onboarding modal" do
        expect(page).not_to have_content("Welcome to Boilerplate")
      end
    end
  end

  describe "when second login" do
    let(:user) { build(:user) }

    before do
      visit new_user_registration_path
      sign_up_with_capybara(user)
      sign_out(user)
      visit new_user_session_path
      sign_in_with_capybara(user)
    end

    it "does not display onboarding modal" do
      expect(page).not_to have_content("Welcome to Boilerplate")
    end
  end
end
