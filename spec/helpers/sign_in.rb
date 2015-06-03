def sign_in email, password
  visit '/sessions/new'
  within('#sign-in-form') do
    fill_in "email", with: email
    fill_in "password", with: password
    click_button "Sign In"
  end
end