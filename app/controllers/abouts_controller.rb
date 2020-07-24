class AboutsController < ApplicationController
	before_action :set_page

	def index
		@content = Content.of_page(@current_page).display_ordered
		@content_count = @content.count
		
		@new_content = Content.new
	end

	private
	def set_page
		@current_page = Page.named("About")
	end
end