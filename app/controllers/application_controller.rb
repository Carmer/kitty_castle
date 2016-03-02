class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_kitty
    @current_kitty ||= Kitty.find_by(id: session[:kitty_id]) if session[:kitty_id]
  end
end
