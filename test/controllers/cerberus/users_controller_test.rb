require 'test_helper'

module Cerberus
  class UsersControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test "should render the 'login' form" do
      get login_url

      assert_template 'login'
    end

    test "should render 'login' template if authentication fails" do
      User.create email: 'me@mail.com', password: 'abcd1234', password_confirmation: 'abcd1234'
      post authenticate_users_url, params: { user: { email: 'me@mail.com', password: 'abcd1234x' } }

      assert_template 'login'
    end

    test "should authenticate user" do
      User.create email: 'me@mail.com', password: 'abcd1234', password_confirmation: 'abcd1234'
      post authenticate_users_url, params: { user: { email: 'me@mail.com', password: 'abcd1234' } }

      assert_redirected_to 'http://www.example.com/'
    end

    test "should store user data in session" do
      user = User.create email: 'me@mail.com', password: 'abcd1234', password_confirmation: 'abcd1234'
      post authenticate_users_url, params: { user: { email: 'me@mail.com', password: 'abcd1234' } }

      assert_equal session[:user_id], user.id
    end

    test "should clear session when user logs out" do
      user = User.create email: 'me@mail.com', password: 'abcd1234', password_confirmation: 'abcd1234'
      delete logout_url, {}, { user_id: user.id }

      assert_nil session[:user_id]
    end

    test "should redirect to login_path when user logs out" do
      user = User.create email: 'me@mail.com', password: 'abcd1234', password_confirmation: 'abcd1234'
      delete logout_url, {}, { user_id: user.id }

      assert_redirected_to login_url
    end
  end
end
