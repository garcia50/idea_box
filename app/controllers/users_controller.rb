class UsersController < ApplicationController

  def index
    @user = User.all
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "#{@user.name} account created!"
      redirect_to users_path
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password_digest)      
    end
end