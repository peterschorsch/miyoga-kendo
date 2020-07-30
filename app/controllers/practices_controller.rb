class PracticesController < ApplicationController
	before_action :set_page, only: [:index, :create, :update]
	before_action :set_content, only: [:index, :create, :update]
	before_action :set_practice, only: [:update, :destroy]

	def index
		@miyoga_user = User.get_miyoga_user
		
		@practices = Practice.all
		@practice_count = @practices.count-1
		@practice_cost = "$" + @practices.first.cost_per_month + " per month"

		@new_practice = Practice.new
	end

	def create
		@new_practice = Practice.new(practice_params)
		@new_practice.content_id = @content.id
		@new_practice.day_of_week_index = check_day_for_index(practice_params.dig("day_of_week"))
		@new_practice.user_id = current_user.id

		respond_to do |format|
			if @new_practice.save
				format.html { redirect_to request.referrer, notice: 'The New Practice was successfully created.' }
			else
				format.html { redirect_back(fallback_location: root_path) }
				format.json { render json: @new_practice.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		@practice.day_of_week_index = check_day_for_index(practice_params.dig("day_of_week"))
		@practice.start_time = practice_params.dig("start_time(4i)") + ":" + practice_params.dig("start_time(5i)")
		@practice.end_time = practice_params.dig("end_time(4i)") + ":" + practice_params.dig("end_time(5i)")
		@practice.content_id = @content.id
		@practice.user_id = current_user.id

		respond_to do |format|
	      if @practice.update(practice_params)
	        format.html { redirect_to practices_path, notice: "#{@practice.day_of_week} practice was successfully updated." }
	        format.json { render :show, status: :ok, location: @user }
	      else
	        format.html { render :edit }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def destroy
		@practice.destroy
	    respond_to do |format|
	      format.html { redirect_to practices_path, notice: 'The class was successfully removed.' }
	      format.json { head :no_content }
	    end
	end

	private
	def set_page
		@current_page = Page.named("Classes")
	end

	def set_content
		@content = Content.of_page(@current_page).named("Class Schedule")
	end

	def set_practice
		@practice = Practice.find(params[:id])
    end

    def practice_params
		params.require(:practice).permit(:day_of_week, :start_time, :end_time, :cost_per_month, :content_id)
    end

    def check_day_for_index(day_of_week)
		days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
		return days.index(day_of_week)+1
    end
end