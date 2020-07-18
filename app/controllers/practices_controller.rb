class PracticesController < ApplicationController
	before_action :set_page

	def index
		@content = Content.of_page(@current_page)
		@miyoga_contact = Contact.named("Miyoga Kendo Club")
		@jcc_contact = Contact.named("Japanese Culture Center")
		
		@practice_location = @miyoga_contact.address
		@practices = @practice_location.class_schedules
		@practice_count = @practices.count-1
		@practice_cost = "$" + @practices.first.cost_per_month + " per month"
	end


	def set_page
		@current_page = Page.named("Classes")
	end
end