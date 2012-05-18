class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  before_filter :auth_check

  private

  def current_user
    unless session[:user_id]
      redirect_to '/login'
      return
    end

    user = User.find_by_id(session[:user_id]) if session[:user_id]
    unless user
      session[:user_id] = nil
      redirect_to '/login'
      return
    end
    @current_user = user
  end

  def auth_check
    if params[:controller] == 'login'
      return
    end

    if params[:controller] == 'sessions' && (!session[:user_id] || params[:action] == 'destroy')
      return
    end

    current_user
  end
end
