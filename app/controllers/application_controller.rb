class ApplicationController < ActionController::Base
	helper_method :current_user

	before_action :active_header_pages

	def current_user
		if session[:user_id]
			@current_user ||= User.find(session[:user_id])
		else
			@current_user = nil
		end
	end

	def active_header_pages
		@active_ordered_pages = Page.active_ordered_pages.select(:name, :path)
	end

end
