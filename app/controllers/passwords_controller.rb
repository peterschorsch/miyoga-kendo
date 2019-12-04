class PasswordsController < ApplicationController

	def forgot
	    if params[:email].blank? # check if email is present
	      return render json: {error: 'Email not present'}
	    end

	    @user = User.find_by(email: params[:email]) # if present find user by email
	    puts @user.inspect
	    puts @user.present?
	    if @user.present?
	      @user.generate_password_token! #generate pass token

	      # SEND EMAIL HERE
	      UserMailer.forgotten_password_email(@user).deliver_now
	      redirect_to sent_email_path
	      #render json: {status: 'ok'}, status: :ok
	    else
	      render json: {error: ['Email address not found. Please check and try again.']}, status: :not_found
	    end
	 end

	def reset
	    token = params[:token].to_s
	    #if params[:email].blank?
	      #return render json: {error: 'Token not present'}
	    #end

	    @user = User.find_by(reset_password_token: token)
	    respond_to do |format|
		    if @user.present? && @user.password_token_valid?
		      if @user.reset_password!(params[:password])
		      	format.html { redirect_to login_path, notice: "Your password was successfully updated." }
		      else
		      	format.html { redirect_to reset_password_path, notice: "Your password was unsuccessfully updated." }
		      end
		    else
		      format.html { redirect_to reset_password_path, notice: "User and/or token not found." }
		    end
		end
	  end
end