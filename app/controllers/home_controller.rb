class HomeController < ApplicationController
	layout "main_page"
	before_action :set_page

	def landing_page
		@about_miyoga = Content.about_miyoga
		@upcoming_event = Event.display_active.first
		@miyoga_contact_email = User.get_miyoga_user.email

		@top_home_image = @contents.first.images.first
		@bottom_home_image = @contents.second.images.first
	end

	def set_page
		@page = Page.named("Home")
		@contents = @page.contents
	end
end
