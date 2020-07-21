class State < ApplicationRecord
	has_many :addresses

	scope :find_by_abbr, -> (abbreviation) {
		where(:abbreviation => abbreviation).first
	}

	scope :sort_by_name, -> {
		order(:name, :abbreviation)
	}

	scope :sort_by_abbr, -> {
		order(:abbreviation, :name)
	}

end
