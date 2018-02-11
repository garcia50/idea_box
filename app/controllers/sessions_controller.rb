class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password_digest])
      session[:user_id] = user.id
      redirect_to user_path(user)
      flash[:success] = "Welcome, #{user.name}!"
    else
      render :new
    end
  end

  def destroy
    User.find(session[:user_id]).destroy      
    session[:user_id] = nil         
    redirect_to root_path
  end



end