class Announcement < ApplicationRecord
	belongs_to :user
	belongs_to :page

	validates :heading, presence: true

	scope :pinned_news, -> {
		includes(:user).where(:pinned => true).by_recent_creation_date
	}

	scope :unpinned_news, -> {
		includes(:user).where(:pinned => false).by_recent_creation_date
	}

	scope :by_recent_creation_date, -> {
		order('created_at DESC')
	}

	scope :by_recent_update_date, -> {
		order('created_at ASC')
	}

end
