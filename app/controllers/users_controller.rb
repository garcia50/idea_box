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
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "This email already exists in our database!"
      render :new
    end
  end

  def show 
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)      
    end
end