class Admin::PracticesController < Admin::AdminController
  before_action :set_class_schedule, only: [:edit, :update, :destroy]
  before_action :set_current_page, only: [:create]

  # GET /class_schedules
  # GET /class_schedules.json
  def index
    @practices = Practice.all
  end

  # GET /class_schedules/new
  def new
    @practice = Practice.new
  end

  # GET /class_schedules/1/edit
  def edit
  end

  # POST /class_schedules
  # POST /class_schedules.json
  def create
    @practice = Practice.new(practice_params)

    @practice.day_of_week_index = check_day_for_index(practice_params.dig("day_of_week"))
    @practice.start_time = practice_params.dig("start_time(4i)") + ":" + practice_params.dig("start_time(5i)")
    @practice.end_time = practice_params.dig("end_time(4i)") + ":" + practice_params.dig("end_time(5i)")
    @practice.content_id = Content.of_page(@current_page).first.id

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

  # PATCH/PUT /class_schedules/1
  # PATCH/PUT /class_schedules/1.json
  def update
    respond_to do |format|
      if @practice.update(practice_params)
        format.html { redirect_to admin_practices_path, notice: 'The class schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @practice }
      else
        format.html { render :edit }
        format.json { render json: @practice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_schedules/1
  # DELETE /class_schedules/1.json
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
      params.require(:practice).permit(:day_of_week, :start_time, :end_time, :cost_per_month, :content_id)
    end

    def check_day_for_index(day_of_week)
      days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
      return days.index(day_of_week)+1
    end
end
