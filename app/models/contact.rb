class Contact < ApplicationRecord
	belongs_to :address

	validates :name, presence: true
	validates :email, uniqueness: true, allow_blank: true

	before_validation :strip_fields
	validates :phone, length: { is: 10 }, allow_blank: true
	validates_format_of :phone,
	    length: { in: 10 },
	    :with => /\d{10}/,
	    :message => "must be in the following format: 1234567890",
	    allow_nil: true,
	    allow_blank: false

	scope :named, -> (name) {
		find_by(:name => name)
	}

	protected
		def strip_fields
			self.phone = nil if phone.blank?
			self.email = nil if email.blank?
			self.website = nil if website.blank?
			self.notes = nil if website.blank?
		end
end
