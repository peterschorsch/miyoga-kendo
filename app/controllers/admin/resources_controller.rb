class Admin::ResourcesController < Admin::AdminController
  before_action :set_current_page, except: [:new]
  before_action :set_resource, except: [:index, :new, :create]
  

  def index
    @contents = @current_page.contents

    @active_resources = @contents.display_non_articles
    @active_readings = @contents.display_articles
  end

  def show
  end

  def new
    @resource = Content.new
    @resource.links.build

  end

  def create
    @resource = Content.new(resource_params)
    @resource.display_content_on_page = true
    @resource.page_id = @current_page.id

    respond_to do |format|
      if @resource.save
        format.html { redirect_to admin_resource_path(@resource), notice: 'Resource was successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to admin_resources_path, notice: 'Resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @resource.display_content_on_page = false
    respond_to do |format|
      if @resource.update!(resource_params)
        format.html { redirect_to admin_resources_path, notice: 'Content was successfully removed.' }
      else
        format.html { render :edit, notice: 'Content was successfully removed.' }
      end
    end
  end
  

  private
    def set_current_page
      @current_page = Page.named("Resources")
    end

    def set_resource
      @resource = Content.of_page(@current_page).find(params[:id]) 
    end

    # Only allow a list of trusted parameters through.
    def resource_params
      params.require(:content).permit(:heading, :subheading, :description, :index, :display_content_on_page, :_destroy,
      links_attributes: [:id, :name, :link, :image_link, :index, :display_logo, :article, :content_id, :_destroy, 
        image_attributes: [:id, :image, :link_id]])
    end

end
