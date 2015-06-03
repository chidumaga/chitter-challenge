require 'capybara/rspec'
require_relative '../helpers/sign_in'

feature "Posting peeps" do

  before(:each) do
    User.create(name: "Chidu", username: "Swagchief", email: "chidu@chidu.com", password: "12345")
  end

  scenario "Users are able to post peeps when signed in" do
    sign_in("chidu@chidu.com", "12345")
    peep("this is a test peep")
    expect(Peep.count).to eq(1)

    peep = Peep.first

    expect(peep.message).to eq("this is a test peep")
    expect(page).to have_content("this is a test peep")
  end

  def peep msg
    visit '/'
    within('#post_peep') do
      fill_in "peep_message", with: msg
      click_button "Peep!"
    end
  end

end