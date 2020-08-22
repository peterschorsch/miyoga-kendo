class Page < ApplicationRecord
	belongs_to :user
	has_many :contents
	has_many :events
	has_many :news

	scope :active_pages, -> {
		where(:active => true)
	}

	scope :ordered, -> {
		order(:index)
	}

	scope :named, -> (name) {
		find_by(:name => name)
	}

	scope :guest_user_pages, -> {
		where.not(:name => "News").active_pages.ordered.select(:name, :path, :admin_path)
	}

	scope :logged_in_user_pages, -> {
		where(:active => true).active_pages.ordered.select(:name, :path, :admin_path)
	}

end
