class Contact < ApplicationRecord
	belongs_to :address

	scope :named, -> (name) {
		find_by(:name => name)
	}

	scope :find_club_contact, -> {
		find_by(:club => true)
	}

	scope :find_dojo_contact, -> {
		find_by(:dojo_name => true, :dojo_location => true)
	}
end
