class Admin::AnnouncementsController < Admin::AdminController
  before_action :set_current_page
  before_action :set_announcement, only: [:show, :edit, :update, :destroy]
  before_action :pinned_news_limit, only: [:new, :edit]

  def index
    @news = Announcement.active_news.by_recent_creation_date.includes(:user)
  end

  def show
  end

  def new
    @announcement = Announcement.new
  end

  def edit
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
      if @announcement.update(announcement_params)
        format.html { redirect_to admin_announcements_path, notice: 'News was successfully updated.' }
      else
        format.html { render :edit, notice: 'News was unsuccessfully updated.' }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @announcement.user_id = @current_user.id
    @announcement.archived = true

    respond_to do |format|
      if @announcement.save
        format.html { redirect_to admin_announcements_path, notice: 'News was successfully removed.' }
      else
        format.html { render :edit, notice: 'News was unsuccessfully removed.' }
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

    def pinned_news_limit
      @num_pinned_news = !Announcement.reached_pinned_news_limit
    end

    # Only allow a list of trusted parameters through.
    def announcement_params
      params.require(:announcement).permit(:heading, :description, :link, :pdf, :image, :pinned, :archived)
    end
end
