require 'capybara/rspec'
require_relative '../helpers/sign_up'

feature "Chitter user behaviour" do

  scenario "Users can sign up for Chitter" do
    visit '/'
    click_link "Sign Up"

    expect { sign_up }.to change(User, :count).by(1)
    expect(User.count).to eq(1)

    user = User.first
    expect(user.name).to eq("John Bosco")
    expect(user.username).to eq("Chitterer")
  end

  scenario "but must use a unique username and email" do
    User.create(name: "Been Here", username: "beenhere", email: "beenhere@been.com", password: "123")

    visit '/'
    click_link "Sign Up"

    sign_up("Been Here", "beenhere", "beenhere@been.com", "123")

    expect(page).to have_content("This username has been taken")
    expect(page).to have_content("This email has been registered")

  end

end