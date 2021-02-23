class ApplicationController < ActionController::Base
	# For session timeout
	auto_session_timeout 10.minutes

	helper_method :current_user

	before_action :active_header_pages

	def current_user
		@current_user = session[:user_id] ? User.find(session[:user_id]) : nil
	end

	def active_header_pages
		@active_pages = current_user ? Page.logged_in_user_pages : Page.guest_user_pages
	end

end
