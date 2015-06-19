require 'test_helper'

class PhaseTest < ActiveSupport::TestCase
  should validate_presence_of(:phasename).with_message(/can't be empty/)
  should validate_presence_of(:note).with_message(/can't be empty/)

end