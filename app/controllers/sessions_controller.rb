class SessionsController < ApplicationController

  def login
    if session[:user_id]
      redirect_to :controller => 'shelf', :action => 'show'
    end
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to '/', :notice => "Signed in!"
  end

  def logout
    session[:user_id] = nil
    redirect_to '/', :notice => "Signed out!"
  end
end
