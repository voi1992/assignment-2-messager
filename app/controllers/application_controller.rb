class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :format_time
  def current_user
    return @current_user if @current_user
    if session[:user_id]
      @current_user = User.find_by_id(session[:user_id].to_i)
    end
  end

  def format_time time
    time.strftime("%Y-%m-%d %H:%M")
  end

  def logged_in?
    !!current_user
  end
end
