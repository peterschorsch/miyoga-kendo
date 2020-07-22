class Address < ApplicationRecord
	has_many :contacts
    accepts_nested_attributes_for :contacts, reject_if: lambda {|attributes| attributes['name'].blank?}

	belongs_to :event
    accepts_nested_attributes_for :event

	has_many :class_schedules
	belongs_to :state

    validates :address_line_1, :city, :zip_code, presence: true
    validates :zip_code, length: { is: 5 }

    before_create :strip_fields
    before_save :strip_fields

    def strip_fields
        self.address_line_2 = self.address_line_2.blank? ? nil : self.address_line_2
    end

    def concat_address_dropdown
        line_2 = address_line_2.nil? ? " " : " " << address_line_2 << " "
        return address_line_1 << line_2 << city << ", " << state.name << " " << zip_code
    end
end
