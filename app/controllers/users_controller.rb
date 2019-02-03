class UsersController < ApplicationController

  skip_before_action :check_session, only: [:new,:signup,:signin]

  def new
    @user = User.new
  end

  def signup
    @user = User.new
    puts "here"
    if @user.check_params(user_params) == false
      display_message("Empty fields/Passowrd length small/Username already taken/Email already exist")
    else
      @user = @user.create_user(user_params)
      if @user != nil
        set_session(user_params)
      else
        display_message("some error occured")
      end
    end
  end

  def signin
    @user = User.new
    @user = @user.check_login(user_params)
    if @user != nil
      set_session(user_params)
    else
      display_message("Invalid Username Password")
    end
  end

  def logout 
    session[:username]=nil
    session[:authenticate]=false
    session[:expires_at] = Time.current
    @user = User.new
    render 'new' 
  end

  def display_message(message)
    flash[:message]=message
    render 'new'
  end
  
  def set_session(user_params)
    session[:username] = User.where(email: user_params[:email]).first[:username]
    session[:authenticate] = true
    session[:expires_at] = Time.current + 10.minutes
    redirect_to articles_path
  end
   private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
