module Cerberus
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

  private

    def authenticate!
      redirect_to login_path, alert: 'No estás autorizado para acceder a esta página' unless current_user
    end
  end
end
