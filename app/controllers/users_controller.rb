class UsersController < ApplicationController
  before_action :authorized?

  # GET /admin/users/1/edit
  def edit
  end

  # PATCH/PUT /admin/users/1
  # PATCH/PUT /admin/users/1.json
  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to edit_user_path(current_user), notice: "Your account was successfully updated." }
        format.json { render :show, status: :ok, location: @current_user }
      else
        format.html { render :edit }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_password
    respond_to do |format|
      if current_user.update_with_password(user_password_params)
        format.html { redirect_to edit_user_path(current_user), notice: "Your password was successfully updated." }
      else
        format.html { render :edit }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :role, :password, :active)
    end

    def user_password_params
      # NOTE: Using 'strong_parameters' gem
      params.require(:user).permit(:id, :current_password, :password, :password_confirmation)
    end

    private
    def authorized?
    user = User.find(params[:id] || params[:user][:id])
    ### IF CURRENT USER IS EXISTS || USER DOESN'T MATCH CURRENT USER || IS NOT AN ADMIN, ARCHIVED OR A GUEST
    if current_user.blank? || current_user != user || (current_user.is_admin? || current_user.is_archived? || current_user.is_guest?)
        flash[:alert] = "You are not authorized to do said action."
        redirect_to admin_root_path
      end
    end
end
