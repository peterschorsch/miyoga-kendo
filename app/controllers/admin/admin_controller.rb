class Admin::AdminController < ApplicationController
	layout "admin/application"

	before_action :authorized?, :sidebar_objects, 

	def dashboard
		@users = User.select(:id, :firstname, :lastname, :email, :role, :last_login).order_by_last_login.first(6)
		@contents = Content.active_last_updated.first(5)

		@social_media = SocialMedium.all
	end

	def sidebar_objects
		@user_data = [["All Users", admin_users_path], [@miyoga_user.concat_name, edit_admin_user_path(@miyoga_user)], ["My User Settings", edit_admin_user_path(current_user)]]
		@miscellaneous = [["Event Addresses", admin_addresses_path], ["Social Media", admin_social_media_path]]
	end

	private
		def authorized?
			if current_user.nil?
				reset_session
				render_session_timeout
			else
				if not current_user.is_admin? || current_user.is_archived?
					flash[:alert] = "You are not authorized to do said action."
					redirect_to root_path
				end
			end
		end

end