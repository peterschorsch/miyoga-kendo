class AnnouncementsController < ApplicationController
	before_action :set_page

	def index
		@pinned_news = Announcement.pinned_news
		@other_news = Announcement.unpinned_news.map { |news| news }
	end

	private
	def set_page
		@current_page = Page.named("News")
	end
end