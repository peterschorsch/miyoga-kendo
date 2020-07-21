class Contact < ApplicationRecord
	belongs_to :address

	validates :name, presence: true
	validates :email, uniqueness: true, allow_blank: true

	before_validation :check_phone
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

	scope :find_club_contact, -> {
		where(:club => true).select(:name, :phone, :email, :notes, :address_id)[0]
	}

	scope :find_dojo_contact, -> {
		where(:dojo_name => true, :dojo_location => true).select(:name, :phone, :email, :website, :notes, :address_id)[0]
	}

	protected
		def check_phone
			self.phone = nil if phone.blank?
		end
end
