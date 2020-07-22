class PracticesController < ApplicationController
	before_action :set_page

	def index
		@content = Content.of_page(@current_page).display_ordered
		@miyoga_user = User.get_miyoga_user
		
		@practices = ClassSchedule.all
		@practice_count = @practices.count-1
		@practice_cost = "$" + @practices.first.cost_per_month + " per month"
	end

	private
	def set_page
		@current_page = Page.named("Classes")
	end
end