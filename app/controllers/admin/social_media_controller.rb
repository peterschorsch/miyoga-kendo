class Admin::SocialMediaController < Admin::AdminController
  before_action :set_social_medium, only: [:show, :edit, :update, :destroy]

  # GET /social_media
  # GET /social_media.json
  def index
    @social_media = SocialMedium.includes(:user).all
  end

  # GET /social_media/new
  def new
    @social_medium = SocialMedium.new
  end

  # GET /social_media/1/edit
  def edit
  end

  # POST /social_media
  # POST /social_media.json
  def create
    @social_medium = SocialMedium.new(social_medium_params)
    @social_medium.user_id = current_user.id

    respond_to do |format|
      if @social_medium.save
        format.html { redirect_to admin_social_media_path, notice: 'Social Media was successfully created.' }
        format.json { render :show, status: :created, location: @social_medium }
      else
        format.html { render :new }
        format.json { render json: @social_medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /social_media/1
  # PATCH/PUT /social_media/1.json
  def update
    @social_medium.user_id = current_user.id

    respond_to do |format|
      if @social_medium.update(social_medium_params)
        format.html { redirect_to admin_social_media_path, notice: 'Social Media was successfully updated.' }
        format.json { render :show, status: :ok, location: @social_medium }
      else
        format.html { render :edit }
        format.json { render json: @social_medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /social_media/1
  # DELETE /social_media/1.json
  def destroy
    @social_medium.destroy
    respond_to do |format|
      format.html { redirect_to admin_social_media_path, notice: 'Social Media was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_social_medium
      @social_medium = SocialMedium.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def social_medium_params
      params.require(:social_medium).permit(:site_name, :site_link, :image)
    end
end
