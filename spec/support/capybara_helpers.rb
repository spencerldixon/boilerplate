module CapybaraHelpers
  def sign_up_with_capybara(user)
    fill_in "user_first_name", with: user.first_name
    fill_in "user_last_name", with: user.last_name
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    fill_in "user_password_confirmation", with: user.password
    check "user_terms_and_conditions"
    click_on "commit"
  end

  def sign_in_with_capybara(user)
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_on "commit"
  end
end
