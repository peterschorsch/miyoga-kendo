class Admin::AnnouncementsController < Admin::AdminController
  before_action :set_current_page
  before_action :set_announcement, only: [:show, :edit, :update]

  def index
    @news = Announcement.all.includes(:user)
  end

  def show
  end

  def edit
  end

  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new(announcement_params)
    @announcement.page_id = @current_page.id
    @announcement.user_id = @current_user.id

    respond_to do |format|
      if @announcement.save
        format.html { redirect_to admin_announcements_path, notice: 'News was successfully created.' }
        format.json { render :show, status: :created, location: @announcement }
      else
        format.html { render :new }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @announcement.user_id = @current_user.id
    respond_to do |format|
      if @announcement.update!(announcement_params)
        format.html { redirect_to admin_announcements_path, notice: 'News was successfully updated.' }
      else
        format.html { render :edit, notice: 'News was unsuccessfully updated.' }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_current_page
      @current_page = Page.named("News")
    end

    def set_announcement
      @announcement = Announcement.find(params[:id]) 
    end

    # Only allow a list of trusted parameters through.
    def announcement_params
      params.require(:announcement).permit(:heading, :description, :link, :pdf, :image, :pinned, :archived)
    end
end
