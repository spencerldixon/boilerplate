require "rails_helper"

RSpec.describe "Accessibility", type: :system do
  it "is accessible", js: true do
    visit root_path
    expect(page).to be_axe_clean.according_to("wcag2a", "wcag2aa", "wcag21aa", "best-practice")
  end
end
