class HomeController < ApplicationController

	def index
		@about_miyoga = Content.about_miyoga
		@upcoming_event = Event.display_active.limit(1).first
		@miyoga_contact = Contact.find_club_contact
	end
end
