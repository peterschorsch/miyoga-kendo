class Admin::AddressesController < Admin::AdminController
  before_action :set_address, except: [:index, :new, :create]
  
  def index
    @addresses = Address.all.includes(:state, :user)
  end

  def new
    @address = Address.new
  end

  def edit
  end

  def create
    @address = Address.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to admin_addresses_path, notice: "Address was successfully created." }
        format.json { render :index, status: :created, location: @address }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to admin_addresses_path, notice: 'Address was successfully updated.' }
        format.json { render :index, status: :ok, location: @address }
      else
        format.html { render :edit }
      end
    end
  end

  private
    def set_address
      @address = Address.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def address_params
      params.require(:address).permit(:location_name, :address_line_1, :address_line_2, :city, :zip_code, :notes, :user_id, :state_id)
    end

end
