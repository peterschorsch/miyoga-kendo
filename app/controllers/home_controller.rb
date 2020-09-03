class HomeController < ApplicationController
	layout "landing_page"

	def landing_page
		@about_miyoga = Content.about_miyoga
		@upcoming_event = Event.display_active.first
		@miyoga_contact_email = User.get_miyoga_user.email
	end
end
