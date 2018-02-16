class Admin::UsersController < Admin::BaseController

  def index
    @users = User.all
  end

  def show
    @user = current_user
  end
end