class Admin::AdminController < ApplicationController
	before_action :authorized?, :active_header_pages

	def dashboard
		@user_count = User.pluck(:id).count
		@users = User.select(:firstname, :lastname, :email, :role, :last_login).order_by_last_login.first(5)

		@social_media = SocialMedium.all
	end

	def active_header_pages
		@active_ordered_pages = Page.active_ordered_pages
	end

	private
	  def authorized?
		if current_user && (current_user.is_user? || current_user.is_archived? || current_user.is_guest?)
	  		session[:user_id] = nil
	    	flash[:alert] = "You are not authorized to do said action."
	    	redirect_to root_path
	    end
	  end
end