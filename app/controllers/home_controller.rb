class HomeController < ApplicationController
	layout "landing_page"

	def landing_page
		@about_miyoga = Content.about_miyoga
		@upcoming_event = Event.display_active.limit(1).first
		@miyoga_user = User.get_miyoga_user
	end
end
