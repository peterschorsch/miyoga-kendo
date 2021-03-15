class Admin::EventsController < Admin::AdminController
  before_action :set_current_page
  before_action :set_event_address, only: [:show, :edit, :update]

  def index
    @events = Event.includes(:user, address: :state).display_active
  end

  def show
  end

  def new
    @event = Event.new
    @event.build_address
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    update_fks

    respond_to do |format|
      if @event.save
        format.html { redirect_to admin_events_path, notice: "A new event was successfully created." }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    update_fks

    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to admin_events_path, notice: 'Event was successfully updated.' }
        format.json { render :index, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    def set_current_page
      @current_page = Page.named("Events")
    end

    def set_event_address
      @event = @current_page.events.find(params[:id])
      @address = @event.address
    end

    def update_fks
      @event.user_id = @current_user.id
      @event.page_id = @current_page.id
    end

    def event_params
      params.require(:event).permit(:id, :title, :start_date, :end_date, :description, :display, :address_id)
    end
end
