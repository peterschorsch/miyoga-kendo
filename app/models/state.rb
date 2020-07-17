class State < ApplicationRecord
	has_many :addresses

	scope :find_by_abbr, -> (abbreviation) {
		where(:abbreviation => abbreviation).first
	}

end
