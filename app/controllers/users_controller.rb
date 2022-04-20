

  
class UsersController < ApplicationController
     skip_before_action :authorized, only: [:new, :create]
   
  def new   
    @user = User.new
  end
  def create
    @user = User.new(email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
    respond_to do |format|
      if @user.save
        format.html { redirect_to '/blogs/new', notice: "User was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
  
end


