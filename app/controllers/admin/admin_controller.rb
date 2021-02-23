class Admin::AdminController < ApplicationController
	layout "admin/application"

	before_action :authorized?, :sidebar_objects

	def dashboard
		@users = User.select(:firstname, :lastname, :email, :role, :last_login).order_by_last_login.first(5)

		@social_media = SocialMedium.all
	end

	def sidebar_objects
		@miscellaneous = [["Users", admin_users_path], ["My User Settings", edit_admin_user_path(current_user)], ["Social Media", admin_social_media_path]]
	end

	private
		def authorized?
			if current_user.nil?
				reset_session
				render_session_timeout
			else
				if current_user.is_user? || current_user.is_archived? || current_user.is_guest?
					flash[:alert] = "You are not authorized to do said action."
					redirect_to root_path
				end
			end
		end
end