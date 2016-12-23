require 'test_helper'

class Cerberus::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Cerberus
  end
end
