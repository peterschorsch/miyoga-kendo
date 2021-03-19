class Admin::HomeController < Admin::AdminController
  before_action :set_current_page, :set_contents
  before_action :set_image, only: [:edit, :update]

  def index
    @contents = @contents.includes(:user).active_ordered
  end

  def edit
  end

  def update
    @image.content.user_id = @current_user.id
    puts "---------------"
    puts @image.inspect
    respond_to do |format|
      if @image.update!(image_params)
        format.html { redirect_to admin_home_index_path, notice: 'Image was successfully updated.' }
      else
        format.html { render :edit, notice: 'Image was unsuccessfully updated.' }
      end
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
      @images = (@contents.first.images << @contents.second.images)
      return @image = @images.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def image_params
      params.permit(:id, :image)
    end
end
