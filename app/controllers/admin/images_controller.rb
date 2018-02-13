class Admin::ImagesController < Admin::BaseController

  def index
    @images = Image.all
  end

  def new
    @image = Image.all
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:success] = "Image Added!"
      redirect_to user_ideas_path(@images.user)
    else
      render :new
    end
  end

  def destroy
    image = Image.find(params[:id])
    image.destroy 

    redirect_to user_ideas_path(image.user)
  end

  private

    def image_params
      params.require(:image).permit(:image_url)
    end
end
