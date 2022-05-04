class SessionsController < ApplicationController
skip_before_action :authorized, only: [:new, :create, :welcome, :login]

    
  def new
 flash.clear()
  end
  def create
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
          session[:user_id] = user.id 
          redirect_to '/blogs/new'
      else
          # if email or password incorrect, re-render login page:
          flash.now.notice = "Incorrect email or password, try again."
          render :new
      end

  end
  def welcome
      
  end
  def login
    redirect_to sign_in_path unless logged_in?  
  end
  def destroy
    #byebug
    session[:user_id] = nil
    redirect_to '/blogs'
  end
    
end