class SessionsController < ApplicationController
  
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.admin?
        flash[:success] = "Welcome your highness!"
        redirect_to admin_user_path(user)
      else
        flash[:success] = "Welcome, #{user.name}!"
        redirect_to user_path(user)
      end
    else
      flash[:error] = "Did you forget you password? Cuz I don't know it!"
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

end