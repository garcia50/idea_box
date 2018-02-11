class IdeasController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @idea = @user.idea.all
  end

  def new
    @user = User.find(params[:user_id])
    @idea = @user.idea.new
  end

  def create
    @user = User.find(params[:user_id])
    @idea = @user.idea.new(idea_params)
    if @idea.save
      flash[:success] = "Great idea!"
      redirect_to 
  end


  private

    def idea_params
      params.require(:idea).permit(:content)
    end
end