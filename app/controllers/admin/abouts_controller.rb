class Admin::AboutsController < Admin::AdminController
  before_action :set_current_page
  before_action :set_content, except: [:index, :new, :create]

  def index
    @contents = @current_page.contents.includes(:user).active_ordered
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
    @content.user_id = @current_user.id

    respond_to do |format|
      if @content.save
        format.html { redirect_to admin_about_path(@content), notice: 'Content was successfully created.' }
        format.json { render :show, status: :created, location: @content }
      else
        format.html { render :new }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @content.user_id = @current_user.id
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to admin_abouts_path, notice: 'Content was successfully updated.' }
      else
        format.html { render :edit, notice: 'Content was unsuccessfully updated.' }
      end
    end
  end

  private
    def set_current_page
      @current_page = Page.named("About")
    end

    def set_content
      @content = @current_page.contents.find(params[:id]) 
    end

    # Only allow a list of trusted parameters through.
    def content_params
      params.require(:content).permit(:heading, :subheading, :description, :index, :archived, :_destroy,
      images_attributes: [:id, :image, :content_id, :_destroy])
    end
end
