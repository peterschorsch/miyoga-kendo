class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  # GET /admin/users/1
  # GET /admin/users/1.json
  def show
  end

  # GET /admin/users/1/edit
  def edit
    puts @user.inspect
    puts @user.firstname
  end

  # PATCH/PUT /admin/users/1
  # PATCH/PUT /admin/users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_path(@user), notice: "#{@user.concat_name} was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_password

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :role, :password, :active)
    end
end
