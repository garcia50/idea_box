class Admin::CategoriesController < Admin::BaseController
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category saved!"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to admin_categories
  end

  private

    def category_params
      params.require(:category).permit(:title)
    end

end