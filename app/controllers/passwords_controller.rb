class PasswordsController < ApplicationController

	def forgot
	    if params[:email].blank? # check if email is present
	      return render json: {error: 'Email not present'}
	    end

	    @user = User.find_by(email: params[:email]) # if present find user by email
	    if @user.present?
	      @user.send_forgotten_password_email

	      redirect_to sent_email_path
	      #render json: {status: 'ok'}, status: :ok
	    else
	      render json: {error: ['Email address not found. Please check and try again.']}, status: :not_found
	    end
	 end

	def reset
	    token = params[:token].to_s

	    @user = User.find_by(reset_password_token: token)

	    respond_to do |format|
		    if @user.present? && @user.password_token_valid?
				@user.reset_password!(params[:password].to_s)
				if @user.save
					format.html { redirect_to login_path, notice: "Your password was successfully updated." }
				else
					format.html { redirect_to reset_password_path, notice: "Your password was unsuccessfully updated. Please ensure the token is correct and the password meets the necessary requirments." }
				end
		    else
		      format.html { redirect_to reset_password_path, notice: "User and/or token not found." }
		    end
		end
	end
end