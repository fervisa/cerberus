require 'test_helper'

module Cerberus
  class UserTest < ActiveSupport::TestCase
    test "should validate presence of email and password" do
      user = User.new
      assert_not user.valid?
      assert_equal [:email, :password].sort, user.errors.keys.sort
    end
  end
end
