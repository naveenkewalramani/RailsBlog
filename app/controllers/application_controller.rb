class ApplicationController < ActionController::Base
  before_action :check_session 
  def check_session
    if(session[:expires_at]!=nil)
      if(session[:authenticate]==false)
        redirect_to users_new_path
      elsif session[:expires_at] < Time.current
        session[:authenticate]=false
        session[:username]=nil
        redirect_to users_new_path
      end
    end
  end
end
