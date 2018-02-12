class IdeasController < ApplicationController

  def index
    @user = current_user
    @ideas = @user.ideas.all
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

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    @idea.update(idea_params)
    if @idea.save
      flash[:success] = "Idea Updated!"
      redirect_to user_ideas_path(@idea.user)
    else
      render :edit
    end
  end


  private

    def idea_params
      params.require(:idea).permit(:content)
    end
end