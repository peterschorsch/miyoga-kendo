class ApplicationController < ActionController::Base
	helper_method :current_user

	before_action :active_header_pages

	def current_user
		@current_user ||= session[:user_id] ? User.find(session[:user_id]) : User.get_guest_user
	end

	def active_header_pages
		@active_pages = Page.active_ordered_pages.select(:name, :path, :admin_path)
	end

end
