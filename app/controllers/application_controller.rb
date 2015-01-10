class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :log_in!, :logged_in?

  private
  def log_in!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def logged_in?
    if !current_user.nil?
      return session[:session_token] == current_user.session_token
    else
      false
    end
  end

  def log_out!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def current_user
    return nil if session[:session_token].nil?

    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def authenticate
    redirect_to new_session_url unless logged_in?
  end

end
