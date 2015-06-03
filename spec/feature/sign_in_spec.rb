require 'capybara/rspec'
require_relative '../helpers/sign_in'

feature "Session management" do
  before(:each) do
    User.create(name: "Chidu", username: "Swagchief", email: "chidu@chidu.com", password: "12345")
  end

  scenario "Registered users can sign into Chitter" do
    visit '/'
    click_link 'Sign In'

    expect(page).not_to have_content("Welcome Chidu")
    sign_in("chidu@chidu.com", "12345")
    expect(page).to have_content("Welcome Swagchief")
  end

end