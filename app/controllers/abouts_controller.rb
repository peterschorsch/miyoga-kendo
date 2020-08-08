class AboutsController < ApplicationController
	before_action :set_page

	def index
		@content = Content.of_page(@current_page).active_ordered.includes(:page, :images, :links)
		
		@new_content = Content.new
		@new_content.images.build
	end

	private
	def set_page
		@current_page = Page.named("About")
	end
end