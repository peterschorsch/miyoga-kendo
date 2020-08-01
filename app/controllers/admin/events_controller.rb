class Admin::EventsController < Admin::AdminController
  before_action :set_current_page
  before_action :set_event_address, only: [:show, :edit, :update]
  before_action :set_state_collection, only: [:new, :edit]

  # GET /events
  # GET /events.json
  def index
    @events = Event.includes(:user, address: :state).display_active
  end

  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    @event.build_address
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(new_event_params)
    update_fks

    respond_to do |format|
      if @event.save
        format.html { redirect_to admin_events_path, notice: "A new event was successfully created." }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end

    #address_id = new_address_params[:id]

    #@existing_address = address_id.blank? ? "" : Address.find(address_id)
    #@existing_contact = address_id.blank? ? "" : @existing_address.contacts.first

    #IF ADDRESS ALREADY EXISTS
    #if !@existing_address.blank? #&& !@existing_contact.blank?
      #@event = Event.new(new_address_params.dig("events_attributes", "0"))
      #@event.address_id = @existing_address.id

      #respond_to do |format|
        #if @event.save!
          #format.html { redirect_to admin_events_path, notice: 'Event was successfully created.' }
          #format.json { render :show, status: :created, location: @address }
        #else
          #format.html { render :new }
          #format.json { render json: @address.errors, status: :unprocessable_entity }
        #end
      #end

    #IF ADDRESS IS NOT FOUND
    #else
      #@address = Address.new(new_address_params)
      #respond_to do |format|
        #if @address.save!
          #format.html { redirect_to admin_events_path, notice: 'Event was successfully created.' }
          #format.json { render :show, status: :created, location: @address }
        #else
          #format.html { render :new }
          #format.json { render json: @address.errors, status: :unprocessable_entity }
        #end
      #end
    #end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    update_fks

    respond_to do |format|
      if @event.update(new_event_params)
        format.html { redirect_to admin_events_path, notice: 'Event was successfully updated.' }
        format.json { render :index, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    def set_current_page
      @current_page = Page.named("Events")
    end

    def set_event_address
      @event = Event.of_page(@current_page).find(params[:id])
      @address = @event.address
    end

    def set_state_collection
      @states = State.return_states_w_names
    end

    def update_fks
      @event.user_id = @current_user.id
      @event.address.user_id = @current_user.id
      @event.page_id = @current_page.id
    end

    def new_event_params
      params.require(:event).permit(:id, :title, :start_date, :end_date, :description, :display, :address_id,
        address_attributes: [:id, :location_name, :address_line_1, :address_line_2, :city, :state_id, :zip_code])
    end

    def new_address_params
      params.require(:address).permit(:id, :location_name, :address_line_1, :address_line_2, :city, :state_id, :zip_code,
      events_attributes: [:id, :title, :start_date, :end_date, :description, :address_id])
    end
end
