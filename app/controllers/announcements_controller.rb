class AnnouncementsController < ApplicationController
	before_action :set_page
	before_action :set_announcement, except: [:index, :create]

	def index
		@pinned_news = Announcement.pinned_news.active_news
		@other_news = Announcement.active_news.unpinned_news.map { |news| news }

		@new_announcement = Announcement.new
	end

	def create
		@announcement = Announcement.new(announcement_params)
		set_user_id
		@announcement.page_id = @current_page.id

		respond_to do |format|
			if @announcement.save!
				format.html { redirect_to announcements_path, notice: 'A New News Item was successfully created.' }
			else
				format.html { render :index }
				format.json { render json: @announcement.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		set_user_id

		respond_to do |format|
			if @announcement.update(announcement_params)
				format.html { redirect_to announcements_path, notice: 'The News Item was successfully updated.' }
			else
				format.html { render :index }
				format.json { render json: @announcement.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@announcement.archived = true
		set_user_id

		respond_to do |format|
			if @announcement.save
				format.html { redirect_to announcements_path, notice: 'The News Item was successfully deleted.' }
			else
				format.html { render :index, notice: 'Event was not deleted.' }
			end
		end
	end

	private
	def set_page
		@current_page = Page.named("News")
	end

	def set_announcement
	  @announcement = Announcement.find(params[:id])
	end

	def set_user_id
		@announcement.user_id = current_user.id
	end

	# Only allow a list of trusted parameters through.
	def announcement_params
	  params.require(:announcement).permit(:heading, :description, :link, :pdf, :image, :pinned, :archived)
	end
end