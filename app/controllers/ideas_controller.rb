class IdeasController < ApplicationController
  before_action :check_user, only: [:new, :index]

  def index
    if current_user.default?
      @ideas = current_user.ideas
    else
      @ideas = Idea.all
    end
  end

  def new
    @idea = current_user.ideas.new
  end

  def create
    require 'pry'; binding.pry
    @idea = current_user.ideas.new(idea_params)
    @idea.category_id = params[:idea][:category_id]  
    if @idea.save
      flash[:success] = "Great idea!"
      redirect_to user_ideas_path(@idea.user)
    else
      flash[:error] = "This idea already exist!"
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

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy

    redirect_to user_ideas_path(@idea.user)
  end

  private

    def idea_params
      params.require(:idea).permit(:content)
    end
end