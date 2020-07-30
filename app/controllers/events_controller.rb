class EventsController < ApplicationController
	before_action :set_event, only: [:update, :destroy]

	def index
		@events = Event.display_active.includes(address: :state).first(3)
		@states_new_form_drop = State.return_states_w_names
		@states_edit_form_drop = State.return_states_w_abbr

		@new_event = Event.new
		@new_event.build_address
	end

	def create
		@event = Event.new(event_params)
		@event.user_id = current_user.id

		respond_to do |format|
			if @event.save
				format.html { redirect_to request.referrer, notice: 'A New Event was successfully created.' }
			else
				format.html { redirect_back(fallback_location: root_path) }
				format.json { render json: @event.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		@event.user_id = current_user.id

		respond_to do |format|
	      if @event.update(event_params)
	        format.html { redirect_to events_path, notice: 'Event was successfully updated.' }
	      else
	        format.html { render events_path }
	      end
	    end
	end

	def destroy
		@event.active = false
		@event.user_id = current_user.id

	    respond_to do |format|
			if @event.save
				format.html { redirect_to events_path, notice: 'Event was successfully deleted.' }
			else
				format.html { render :index, notice: 'Event was not deleted.' }
			end
	    end
	end


	private
	# Use callbacks to share common setup or constraints between actions.
	def set_event
		@event = Event.find(params[:id])
	end

	# Only allow a list of trusted parameters through.
	def event_params
		params.require(:event).permit(:title, :start_date, :end_date, :description, 
			address_attributes: [:id, :location_name, :address_line_1, :address_line_2, :city, :state_id, :zip_code])
	end
end