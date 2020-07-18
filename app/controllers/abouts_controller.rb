class AboutsController < ApplicationController
	before_action :set_page

	def index
		@content = Content.of_page(@current_page).display_ordered
	end


	def set_page
		@current_page = Page.named("About")
	end
end