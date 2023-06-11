require "rails_helper"

RSpec.describe "Session", type: :system do
  let(:user) { create(:user) }

  it "user can sign in" do
    visit root_path
    click_on "Log in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    expect(page).to have_text("Signed in successfully")
    expect(page).to have_text("Welcome back #{user.first_name}")
    expect(current_path).to eq(authenticated_root_path)
  end

  it "user can sign out" do
    sign_in user
    visit root_path

    expect(page).to have_text("Welcome back #{user.first_name}")

    click_on("Log out", match: :first)

    expect(page).to have_text("Signed out successfully")
    expect(current_path).to eq(root_path)
  end
end
