require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  should validate_presence_of(:firstname).with_message(/can't be empty/)
  should validate_presence_of(:lastname).with_message(/can't be empty/) 
  should validate_presence_of(:email).with_message(/can't be empty/)

  #should belong_to(:user)
  should_not allow_value("blah").for(:email)
end
