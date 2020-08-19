class Admin::UsersController < Admin::AdminController
  before_action :set_user, only: [:show, :edit, :update, :update_password, :reset_token]

  # GET /admin/users
  # GET /admin/users.json
  def index
    @users = User.select(:id, :firstname, :lastname, :email, :role, :active, :last_login).remove_guest_account
    @active_users = @users.user_accounts.active_accounts.order_by_name
    @active_admins = @users.admin_accounts.active_accounts.order_by_name
    @inactive_users = @users.user_accounts.archived_accounts.order_by_name
    @inactive_admins = @users.admin_accounts.archived_accounts.order_by_name
  end

  # GET /admin/users/1
  # GET /admin/users/1.json
  def show
  end

  # GET /admin/users/new
  def new
    @user = User.new
  end

  # GET /admin/users/1/edit
  def edit
  end

  # POST /admin/users
  # POST /admin/users.json
  def create
    @user = User.new(user_params)

    @user.set_user_random_password

    respond_to do |format|
      if @user.generate_password_token! #generate pass token
        UserMailer.temporary_password_email(@user).deliver_later

        format.html { redirect_to admin_users_path, notice: "#{@user.concat_name} was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/users/1
  # PATCH/PUT /admin/users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_users_path, notice: "#{@user.concat_name} was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_password
    respond_to do |format|
      if @user.update_with_password(user_password_params)
        format.html { redirect_to edit_admin_user_path(current_user), notice: "#{@user.concat_name}'s password was successfully updated." }
      else
        format.html { render :edit }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def resend_token
    respond_to do |format|
      if @user.send_forgotten_password_email
        format.html { redirect_to admin_users_path(current_user), notice: "#{@user.concat_name} was sent a password reset email." }
      else
        format.html { render :index }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id] || params[:user_id] || params[:user][:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :role, :password, :active)
    end

    def user_password_params
      # NOTE: Using 'strong_parameters' gem
      params.require(:user).permit(:id, :current_password, :password, :password_confirmation)
    end
end
