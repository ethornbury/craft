require 'test_helper'

class WorkphaseTest < ActiveSupport::TestCase
  should validate_presence_of(:product_id).with_message(/can't be empty/)
  should validate_presence_of(:phase_id).with_message(/can't be empty/)
  should validate_presence_of(:totalToMake).with_message(/must be provided/)
end
