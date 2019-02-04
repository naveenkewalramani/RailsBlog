
class User < ApplicationRecord
  
  validates_confirmation_of :password
  

  def check_params(user_params)
    if user_params[:username]=="" || user_params[:email]==""
      puts 1
      return false
    elsif user_params[:password].length < 6
      puts 2
      return false
    elsif User.where(username: user_params[:username]).first !=nil
      puts 3
      return false
    elsif User.where(email: user_params[:email]).first !=nil
      puts 4
      return false
    else
      puts 5
      return true
    end
   end

   def create_user(user_params)
    user = User.new(user_params)
    if user.save
      return user
    else
      return nil
    end
  end

  def check_login(user_params)
    user = User.where(email: user_params[:email], password: user_params[:password]).first
    if user!=nil 
      return user
    else
      return nil
    end
  end

end
