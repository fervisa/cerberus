require "test_helper"

module Cerberus
  class BaseController < ApplicationController
    include Authentication

    before_action :authenticate!

    def index
      render nothing: true
    end
  end

  class BaseControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test "should redirect to login path if no current_user exists" do
      Cerberus::Engine.routes.draw do
        get 'base', to: 'base#index', as: 'base'
        get 'users/login', to: 'users#login', as: 'login'
      end

      get base_url

      assert_redirected_to login_url
      Rails.application.routes_reloader.reload!
    end
  end
end
