class Admin::HomeImagesController < Admin::AdminController
  before_action :set_current_page, :set_contents
  before_action :set_image, only: [:edit, :update]

  def index
    @contents = @contents.includes(:user).active_ordered
  end

  def edit
  end

  def update
    @image.content.user_id = @current_user.id

    if @image.update(image_params)
      redirect_to admin_images_path, notice: 'Image was successfully updated.'
    else
      format.html { render :edit }
    end
  end

  private
    def set_current_page
      @current_page = Page.named("Home")
    end

    def set_contents
      @contents = @current_page.contents
    end

    def set_image
      @image = Image.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def image_params
      params.require(:image).permit(:image)
    end
end
