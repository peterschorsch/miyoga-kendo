class PracticesController < ApplicationController
	before_action :set_page

	def index
		@content = Content.of_page(@current_page).display_ordered
		@miyoga_contact = Contact.find_club_contact
		@jcc_contact = Contact.find_dojo_contact
		
		@practice_location = @miyoga_contact.address
		@practices = @practice_location.class_schedules
		@practice_count = @practices.count-1
		@practice_cost = "$" + @practices.first.cost_per_month + " per month"
	end

	private
	def set_page
		@current_page = Page.named("Classes")
	end
end