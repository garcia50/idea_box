class IdeasController < ApplicationController

  def index
    @user = current_user
    @idea = @user.idea.all
  end

  def new
    @idea = current_user.ideas.new
  end

  def create
    @idea = current_user.ideas.new(idea_params)
    if @idea.save
      flash[:success] = "Great idea!"
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end


  private

    def idea_params
      params.require(:idea).permit(:content)
    end
end