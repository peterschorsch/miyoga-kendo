class Admin::PracticesController < Admin::AdminController
  include SharedPractices

  before_action :set_class_schedule, only: [:edit, :update, :destroy]
  before_action :set_current_page, only: [:create, :update]

  def index
    @practices = Practice.includes(:user).all
  end

  def new
    @practice = Practice.new
  end

  def edit
  end

  def create
    @practice = Practice.new(practice_params)

    set_start_end_time(@practice, practice_params)
    set_contents_fk(@practice, @current_page.contents.first)

    respond_to do |format|
      if @practice.save
        format.html { redirect_to admin_practices_path, notice: 'A New Class was successfully created.' }
        format.json { render :show, status: :created, location: @class_schedule }
      else
        format.html { render :new }
        format.json { render json: @class_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    set_contents_fk(@practice, @current_page.contents.first)

    respond_to do |format|
      if @practice.update(practice_params)
        format.html { redirect_to admin_practices_path, notice: "#{@practice.day_of_week} Practice was successfully updated." }
        format.json { render :show, status: :ok, location: @practice }
      else
        format.html { render :edit }
        format.json { render json: @practice.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @practice.destroy
    respond_to do |format|
      format.html { redirect_to admin_practices_path, notice: 'The class was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_current_page
      @current_page = Page.named("Classes")
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_class_schedule
      @practice = Practice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def practice_params
      params.require(:practice).permit(:day_of_week, :start_time, :end_time, :notes, :cost_per_month, :content_id, :user_id)
    end
end
