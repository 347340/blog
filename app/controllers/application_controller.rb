class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  load_and_authorize_resource

  def current_user
    if session[:current_user].present?
      return User.find session[:current_user]['id']
    end
    return User.new
  end
end
