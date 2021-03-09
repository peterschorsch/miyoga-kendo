class Address < ApplicationRecord
    belongs_to :user, optional: true
    has_many :event
    has_many :images

    accepts_nested_attributes_for :event

	belongs_to :state
    belongs_to :state

    validates :location_name, :address_line_1, :city, :zip_code, presence: true
    validates :zip_code, length: { is: 5 }

    before_create :strip_fields
    before_save :strip_fields

    scope :order_by_name, -> {
        order(:location_name, :address_line_1)
    }

    scope :active_addresses, -> {
        where(:archived => false)
    }

    ### FOR FORMS ###
    scope :return_address_dropdown, -> {
        #order_by_name.pluck(:location_name, :id)
        includes(:state).active_addresses.order_by_name.map{ |address| ["#{address.location_name} - #{address.city}, #{address.state.abbreviation}", address.id ]}
    }

    def strip_fields
        self.address_line_2 = self.address_line_2.blank? ? nil : self.address_line_2
    end

    def concat_address_dropdown
        line_2 = address_line_2.nil? ? " " : " " << address_line_2 << " "
        return location_name << " - " << address_line_1 << line_2 << city << ", " << state.name << " " << zip_code
    end

    def google_maps_address
        "#{self.location_name} #{self.address_line_1} #{self.city} #{self.state.abbreviation}  #{self.zip_code}"
    end
end
