class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def in_logged_in?
    not session[:user_id].nil?
  end
  def redirect_unless_logged_in
    unless logged_in
      redirect_to root_path, alert: "You must be logged in to see this page."
    end
  end
end
