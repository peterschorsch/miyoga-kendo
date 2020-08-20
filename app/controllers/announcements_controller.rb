class AnnouncementsController < ApplicationController
	before_action :set_page

	def index
	end

	private
	def set_page
		@current_page = Page.named("News")
	end
end