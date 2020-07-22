class Admin::ClassSchedulesController < Admin::AdminController
  before_action :set_class_schedule, only: [:show, :edit, :update, :destroy]
  before_action :set_current_page, only: [:create]

  # GET /class_schedules
  # GET /class_schedules.json
  def index
    @class_schedules = ClassSchedule.all
  end

  # GET /class_schedules/1
  # GET /class_schedules/1.json
  def show
  end

  # GET /class_schedules/new
  def new
    @class_schedule = ClassSchedule.new
  end

  # GET /class_schedules/1/edit
  def edit
  end

  # POST /class_schedules
  # POST /class_schedules.json
  def create
    @class_schedule = ClassSchedule.new(class_schedule_params)

    @class_schedule.day_of_week_index = check_day_for_index(class_schedule_params.dig("day_of_week"))
    @class_schedule.start_time = class_schedule_params.dig("start_time(4i)") + ":" + class_schedule_params.dig("start_time(5i)")
    @class_schedule.end_time = class_schedule_params.dig("end_time(4i)") + ":" + class_schedule_params.dig("end_time(5i)")
    @class_schedule.content_id = Content.of_page(@current_page).first.id

    respond_to do |format|
      if @class_schedule.save
        format.html { redirect_to admin_class_schedules_path, notice: 'A New Class was successfully created.' }
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
      if @class_schedule.update(class_schedule_params)
        format.html { redirect_to admin_class_schedules_path, notice: 'The class schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @class_schedule }
      else
        format.html { render :edit }
        format.json { render json: @class_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_schedules/1
  # DELETE /class_schedules/1.json
  def destroy
    @class_schedule.destroy
    respond_to do |format|
      format.html { redirect_to admin_class_schedules_path, notice: 'The class was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_current_page
      @current_page = Page.named("Classes")
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_class_schedule
      @class_schedule = ClassSchedule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def class_schedule_params
      params.require(:class_schedule).permit(:day_of_week, :start_time, :end_time, :cost_per_month, :content_id)
    end

    def check_day_for_index(day_of_week)
      days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
      return days.index(day_of_week)+1
    end
end
