require "rails_helper"

RSpec.describe "Subscriptions", type: :system do
  let(:user) { create(:user) }

  before do
    sign_in user
    visit root_path
  end

  context "with a subscription" do
    let(:user) { create(:user, :with_subscription) }

    it "does not show the subscription banner" do
      expect(page).not_to have_selector("#subscription-banner")
    end
  end

  context "without a subscription" do
    it "shows the subscription banner" do
      expect(page).to have_selector("#subscription-banner")
    end
  end
end
