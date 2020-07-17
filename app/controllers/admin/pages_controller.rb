class Admin::PagesController < Admin::AdminController
	before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index
    @page = Page.active_ordered_pages
  end

  def show
  end

  def new
    @page = Page.new
  end


  def edit
  end

  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to admin_page_path(@page), notice: "#{@page.concat_name} was successfully created." }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @admin_page.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to admin_page_path(@page), notice: "#{@user.concat_name} was successfully updated." }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @admin_page.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_password

  end

  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to admin_pages_path, notice: 'Page was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:name, :index, :active)
    end
end
