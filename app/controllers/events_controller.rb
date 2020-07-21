class EventsController < ApplicationController
	before_action :set_event, only: [:update, :destroy]

	def index
		@events = Event.display_active.includes(address: :contacts).first(3)
		@states = State.sort_by_abbr.select(:id, :abbreviation)
	end

	def update
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
			address_attributes: [:id, :address_line_1, :address_line_2, :city, :state_id, :zip_code, 
			contacts_attributes: [:id, :name, :email, :phone, :website]])
	end
end