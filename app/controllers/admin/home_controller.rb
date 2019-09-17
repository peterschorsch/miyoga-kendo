class Admin::HomeController < ApplicationController
	def dashboard
		@user_count = User.all.count
		@users = User.order_by_last_login.first(5)
	end
end