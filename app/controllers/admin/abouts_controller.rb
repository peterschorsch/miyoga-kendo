class Admin::AboutsController < Admin::AdminController
  before_action :set_current_page, except: [:new]
  before_action :set_content, except: [:index, :new, :create]
  

  def index
    @contents = @current_page.contents.active_ordered
  end

  def show
  end

  def edit
  end

  def new
    @content = Content.new
    @content.images.build
  end

  def create
    @content = Content.new(content_params)
    @content.page_id = @current_page.id

    respond_to do |format|
      if @content.save!
        format.html { redirect_to admin_about_path(@content), notice: 'Content was successfully created.' }
        format.json { render :show, status: :created, location: @content }
      else
        format.html { render :new }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to admin_abouts_path, notice: 'Content was successfully updated.' }
      else
        format.html { render :show, notice: 'Content was unsuccessfully updated.' }
      end
    end
  end

  def destroy
    @content.display_content_on_page = false
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to admin_abouts_path, notice: 'Content was successfully removed.' }
      else
        format.html { render "admin/contents/about_page", notice: 'Content was successfully removed.' }
      end
    end
  end

  private
    def set_current_page
      @current_page = Page.named("About")
    end

    def set_content
      @content = Content.of_page(@current_page).find(params[:id]) 
    end

    # Only allow a list of trusted parameters through.
    def content_params
      params.require(:content).permit(:heading, :subheading, :description, :index, :display_content_on_page, :_destroy,
      images_attributes: [:id, :image, :content_id, :_destroy])
    end
end
