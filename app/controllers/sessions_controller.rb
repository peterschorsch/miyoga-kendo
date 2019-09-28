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
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      @user.update_last_login

      if @user.is_admin?
        redirect_to admin_root_path, notice: "Welcome, #{@user.concat_name}!"
      else
        redirect_to root_url, notice: "Welcome, #{@user.concat_name}!"
      end
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
  	session[:user_id] = nil
    redirect_to root_url, notice: "You have been logged out!"
  end
end
