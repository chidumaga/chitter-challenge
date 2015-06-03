def sign_up name = "John Bosco", username = "Chitterer", email = "first@chitterer.com", password = "123"
  visit '/users/new'
  within('#sign-up-form') do
    fill_in "name", with: name
    fill_in "username", with: username
    fill_in "email", with: email
    fill_in "password", with: password
    click_button "Sign Up"
  end
end