class HomeController < ApplicationController

	def index
		@about_miyoga = Content.about_miyoga
		@upcoming_event = Event.display_active.limit(1).first
		@miyoga_user = User.get_miyoga_user
	end
end
