class Admin::AdminController < ApplicationController
	before_action :authorized?

	def dashboard
		@user_count = User.all.count
		@users = User.order_by_last_login.first(5)
	end

	private
	  def authorized?
	  	if current_user && (current_user.is_user? || current_user.is_archived?)
	  		session[:user_id] = nil
	    	flash[:alert] = "You are not authorized to do said action."
	    	redirect_to root_path
	    end
	  end
end