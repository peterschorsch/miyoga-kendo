class Contact < ApplicationRecord
	belongs_to :address

	scope :named, -> (name) {
		find_by(:name => name)
	}
end
