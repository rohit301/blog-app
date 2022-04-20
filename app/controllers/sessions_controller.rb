class SessionsController < ApplicationController
skip_before_action :authorized, only: [:new, :create, :welcome]

    
  def new
  end
  def create
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
          session[:user_id] = user.id 
          redirect_to '/blogs/new'
      end
  end
  def welcome
      
  end
  def login
  end
  def destroy
    #byebug
    session[:user_id] = nil
    redirect_to '/blogs'
  end
    
end