require_dependency "cerberus/application_controller"

module Cerberus
  class UsersController < ApplicationController
    def login
      @user = User.new
    end

    def authenticate
      user = User.find_by_email(params[:user][:email])
      if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to main_app.root_path
      else
        @user = User.new(email: params[:user][:email])
        flash.now[:error] = 'Nombre de usuario o contraseña no válidos'
        render :login
      end
    end

    def logout
      session[:user_id] = nil
      redirect_to login_path
    end
  end
end
