class Admin::IdeasController < Admin::BaseController
  before_action :check_user, only: [:new, :index]

  def index
    @ideas = Idea.all
  end

  def new
    @idea = current_user.ideas.new
  end

  def create
    @idea = current_user.ideas.new(idea_params)
    @idea.category_id = params[:idea][:category_id]  
    @idea.image_ids = params[:image_url]
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
    @idea.category_id = params[:idea][:category_id]
    @idea.image_ids = params[:image_url] 
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