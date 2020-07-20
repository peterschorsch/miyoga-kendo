class Contact < ApplicationRecord
	belongs_to :address

	scope :named, -> (name) {
		find_by(:name => name)
	}

	scope :find_club_contact, -> {
		where(:club => true).select(:name, :phone, :email, :notes, :address_id)[0]
	}

	scope :find_dojo_contact, -> {
		where(:dojo_name => true, :dojo_location => true).select(:name, :phone, :email, :website, :notes, :address_id)[0]
	}
end
