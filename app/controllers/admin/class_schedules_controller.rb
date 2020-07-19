class Admin::ClassSchedulesController < Admin::AdminController
  before_action :set_class_schedule, only: [:show, :edit, :update, :destroy]

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

    respond_to do |format|
      if @class_schedule.save
        format.html { redirect_to @class_schedule, notice: 'Class schedule was successfully created.' }
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
        format.html { redirect_to @class_schedule, notice: 'Class schedule was successfully updated.' }
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
      format.html { redirect_to class_schedules_url, notice: 'Class schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_schedule
      @class_schedule = ClassSchedule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def class_schedule_params
      params.require(:class_schedule).permit(:day_of_week, :start_time, :end_time, :cost_per_month)
    end
end