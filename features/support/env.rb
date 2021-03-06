# Generated by cucumber-sinatra. (2015-05-22 11:33:12 +0100)

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'lib/chitter.rb')

require 'capybara'
require 'rspec'

Capybara.app = Chitter

class ChitterWorld

  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers

end

World do
  ChitterWorld.new
end
