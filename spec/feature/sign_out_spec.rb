require 'capybara/rspec'
require_relative '../helpers/sign_in'

feature "User can sign out" do

  before(:each) do
    User.create(name: "Chidu", username: "Swagchief", email: "chidu@chidu.com", password: "12345")
  end

  scenario "while being signed in" do
    sign_in("chidu@chidu.com", "12345")
    click_button "Sign out"
    expect(page).to have_content("Goodbye")
  end

end