class EventsController < ApplicationController
	before_action :set_page
	before_action :set_event, only: [:update, :destroy]

	def index
		@events = Event.order_by_recent.includes(:address).first(3)
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
		@event.destroy
	    respond_to do |format|
	      format.html { redirect_to events_path, notice: 'Event was successfully deleted.' }
	    end
	end


	private
		def set_page
			@current_page = Page.named("Events")
		end

		# Use callbacks to share common setup or constraints between actions.
	    def set_event
			@event = Event.find(params[:id])
	    end

	    # Only allow a list of trusted parameters through.
	    def event_params
			params.require(:event).permit(:title, :start_date, :end_date, :description)
	    end
end