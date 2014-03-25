class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    if session['user_id'].present?
      @current_user ||= User.find(session['user_id'].to_i(16))
    end
    @current_user
  end #current_user
end
