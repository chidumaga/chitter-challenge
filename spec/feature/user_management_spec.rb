require 'capybara/rspec'
require_relative '../helpers/sign_up'

feature "Chitter user behaviour" do

  scenario "Users can sign up for Chitter" do
    visit '/'
    click_link "Sign Up"

    expect { sign_up }.to change(User, :count).by(1)

    user = User.first
    expect(user.name).to eq("John Bosco")
    expect(user.username).to eq("Chitterer")
  end

end