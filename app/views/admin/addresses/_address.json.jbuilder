json.extract! address, :id, :location_name, :address_line_1, :address_line_2, :city, :state, :zip_code, :created_at, :updated_at
json.url address_url(address, format: :json)
