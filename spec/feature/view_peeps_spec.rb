require 'capybara/rspec'
require_relative '../helpers/sign_in'

feature "Viewing peeps" do

  before(:each) do
    user = User.create(name: 'Ptolemy', email: 'theking@gmail.com', password: 'secret1234', username: 'Chitter King')
    3.times { |id| user.peep.create(message: "peep #{id + 1}") }
  end

  scenario "users can view peeps in reverse chronological order" do
    sign_in("theking@gmail.com", "secret1234")
    expect(page).to have_content("Peeped by Chitter King at peep 3 Peeped by Chitter King at peep 2 Peeped by Chitter King at peep 1")
  end

end