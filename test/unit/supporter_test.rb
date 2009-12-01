require 'test_helper'

class SupporterTest < ActiveSupport::TestCase
  should "be valid" do
    assert Supporter.new.valid?
  end
end
