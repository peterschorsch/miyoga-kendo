class Address < ApplicationRecord
	has_many :contacts
	accepts_nested_attributes_for :contacts, reject_if: :all_blank

	has_many :events
	has_many :class_schedules
	belongs_to :state

    validates :address_line_1, :city, :zip_code, presence: true
    validates :zip_code, length: { is: 5 }

    before_create :strip_fields
    before_save :strip_fields

    def strip_fields
        self.address_line_2 = self.address_line_2.blank? ? nil : self.address_line_2
    end
end
