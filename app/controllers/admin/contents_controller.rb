class Admin::ContentsController < Admin::AdminController
  before_action :set_content, only: [:show, :edit, :update, :destroy]
  before_action :set_page, only: [:update]

  def about_page
    @page = Page.named("About")
  end

  def resource_page
    @page = Page.named("Resources")
    @contents = @page.contents.includes(:links)
  end

  def index
    @contents = Content.all
    @pages = @contents.pages.includes(:contents)
  end

  def show
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)

    respond_to do |format|
      if @content.save
        format.html { redirect_to @content, notice: 'Content was successfully created.' }
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
        format.html { redirect_to request.referrer, notice: 'Content was successfully updated.' }
      else
        format.html { redirect_to request.referrer, notice: 'Content was unsuccessfully updated.' }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
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
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    def set_page
      @page = @content.page
    end

    # Only allow a list of trusted parameters through.
    def content_params
      params.require(:content).permit(:heading, :subheading, :description, :index, :display_content_on_page,
      links_attributes: [:id, :name, :link, :image_link, :index, :display_logo, :article, :content_id, :_destroy])
    end
end
