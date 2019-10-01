class SessionsController < ApplicationController
  def forgot_password
  end
  def sent_email
  end
  def reset_password
  end

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password]) && @user.is_active?
      session[:user_id] = @user.id
      @user.update_last_login

      redirect_to @user.is_admin? ? admin_root_path : root_url, notice: "Welcome, #{@user.concat_name}!"
    else
      flash.now[:alert] = @user.is_archived? ? "Your account has been marked as inactive" : "Email or password is invalid"
      render "new"
    end
  end

  def destroy
  	session[:user_id] = nil
    redirect_to root_url, notice: "You have been logged out!"
  end
end
