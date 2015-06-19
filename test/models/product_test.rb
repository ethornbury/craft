require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  should validate_presence_of(:productname).with_message(/can't be empty/)
  should validate_presence_of(:desc).with_message(/can't be empty/)
end
