require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_one(:employee)
  
end
