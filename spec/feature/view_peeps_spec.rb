require 'capybara/rspec'

feature "Viewing peeps" do

  before(:each) do
    Peep.create(message: "peep 1")
    Peep.create(message: "peep 2")
    Peep.create(message: "peep 3")
  end

  scenario "users can view peeps in reverse chronological order" do
    visit('/')
    expect(page).to have_content("peep 3 peep 2 peep 1")
  end

end