module Cerberus
  module Authentication
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def self.included m
      m.helper_method :current_user
    end

  private

    def authenticate!
      redirect_to cerberus.login_path, alert: 'No estás autorizado para acceder a esta página' unless current_user
    end
  end
end
