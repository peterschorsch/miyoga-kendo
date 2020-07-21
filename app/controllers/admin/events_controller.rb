class Admin::EventsController < Admin::AdminController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.includes(address: :state).all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @address = Address.new
    @address.events.build
    @address.contacts.build

    @states = State.return_states_w_names
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    address_id = new_event_page_params[:id]

    @existing_address = address_id.blank? ? "" : Address.find(address_id)
    @existing_contact = address_id.blank? ? "" : @existing_address.contacts.first

    #IF ADDRESS ALREADY EXISTS
    if !@existing_address.blank? && !@existing_contact.blank?
      @event = Event.new(new_event_page_params.dig("events_attributes", "0"))
      @event.address_id = @existing_address.id

      respond_to do |format|
        if @event.save!
          format.html { redirect_to admin_events_path, notice: 'Event was successfully created.' }
          format.json { render :show, status: :created, location: @address }
        else
          format.html { render :new }
          format.json { render json: @address.errors, status: :unprocessable_entity }
        end
      end

    #IF ADDRESS IS NOT FOUND
    else
      @address = Address.new(new_event_page_params)
      respond_to do |format|
        if @address.save!
          format.html { redirect_to admin_events_path, notice: 'Event was successfully created.' }
          format.json { render :show, status: :created, location: @address }
        else
          format.html { render :new }
          format.json { render json: @address.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def new_event_page_params
      params.require(:address).permit(:id, :address_line_1, :address_line_2, :city, :state_id, :zip_code,
      events_attributes: [:id, :title, :start_date, :end_date, :description, :address_id],
      contacts_attributes: [:id, :name, :email, :phone, :website, :address_id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :start_date, :end_date)
    end
end
