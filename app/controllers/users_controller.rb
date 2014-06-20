class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def send_email
    UserMailer.welcome(current_user).deliver
  end

end