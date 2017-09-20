require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/spec"
require 'capybara/rails'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
 fixtures :all

 extend MiniTest::Spec::DSL

end
