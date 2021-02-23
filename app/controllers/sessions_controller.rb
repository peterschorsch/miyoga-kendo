class SessionsController < ApplicationController
  auto_session_timeout_actions

  def forgot_password
  end
  def sent_email
  end
  def reset_password
  end

  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password]) && @user.is_active?
      session[:user_id] = @user.id
      @user.update_last_login

      route = @user.is_admin? ? admin_root_path : root_url

      respond_to do |format|
        format.html { redirect_to route, notice: "Welcome, #{@user.concat_name}!" }
      end
    else
      flash[:alert] = @user.blank? ? "Email or password is invalid" : @user.is_archived? ? "Your account has been marked as inactive" : "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: "You have been logged out!"
  end

   # For session timeout
  def active
    render_session_status
  end

  # For session timeout
  def timeout
    reset_session
    render_session_timeout
  end
end
