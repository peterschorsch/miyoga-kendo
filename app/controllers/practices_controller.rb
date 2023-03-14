class PracticesController < ApplicationController
	include SharedPractices

	before_action :set_page, only: [:index, :create, :update]
	before_action :set_practice, only: [:update, :destroy]

	def index
		@miyoga_user = User.get_miyoga_user
		@dojo_address = @miyoga_user.dojo_address
		@dojo_images = @dojo_address.images

		@content = @current_page.contents.named("Class Schedule")
		@practices = Practice.all
		@practice_notes = @practices.get_practice_notes

		@new_practice = Practice.new
	end

	def create
		@new_practice = Practice.new(practice_params)
		@new_practice.day_of_week_index = check_day_for_index(practice_params.dig("day_of_week"))
		set_contents_fk(@practice, @current_page.contents.first)

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
		set_start_end_time(@practice, practice_params)
		set_contents_fk(@practice, @current_page.contents.first)

		respond_to do |format|
	      if @practice.update(practice_params)
	        format.html { redirect_to practices_path, notice: "#{@practice.day_of_week} Practice was successfully updated." }
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

	def set_practice
		@practice = Practice.find(params[:id])
    end

    def practice_params
		params.require(:practice).permit(:day_of_week, :start_time, :end_time, :cost_per_month, :notes, :content_id, :user_id)
    end
end