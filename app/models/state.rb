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

	### FOR FORMS ###
	scope :return_states_w_names, -> {
		sort_by_abbr.pluck(:name, :id)
	}

	scope :return_states_w_abbr, -> {
		sort_by_abbr.pluck(:abbreviation, :id)
	}

end
