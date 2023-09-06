class Content < ApplicationRecord
	belongs_to :page, optional: true
	belongs_to :user
	has_many :practices

	has_many :links, inverse_of: :content, dependent: :destroy
	accepts_nested_attributes_for :links, :reject_if => proc { |attributes| attributes['name'].blank? || attributes['link'].blank? } #, allow_destroy: true#, :reject_if => proc { |attributes| attributes['address_line_1'].blank? || attributes['city'].nil? || attributes['state_id'].nil?|| attributes['zip_code'].nil? }

	has_many :images, inverse_of: :content, dependent: :destroy
	accepts_nested_attributes_for :images, allow_destroy: true
	#validate :images_presence, on: :create

	validates :heading, presence: true
	validates :index, :uniqueness => { :scope => [:page_id, :archived, :article] }, :if => :index_changed?

	validates :index, numericality: { greater_than: 0  }
	validate :strip_fields
	validate :check_links_articles, on: :update

	scope :of_page, -> (page) {
		where(page_id: page).references(:forms).active_ordered
	}

	scope :named, -> (text) {
		find_by(heading: text)
	}

	scope :about_miyoga, -> {
		find_by(heading: "About Miyoga Kendo")
	}

	scope :active_ordered, -> {
		where(archived: false).order_by_index
	}

	scope :archived_ordered, -> {
		where(archived: true).order_by_index
	}

	scope :active_last_updated, -> {
		where(archived: false).order(updated_at: :DESC)
	}

	scope :order_by_index, -> {
		order(:index)
	}

	### FOR RESOURCES PAGE ###
	scope :display_non_articles, -> {
		where(:article => false).active_ordered
	}

	scope :display_articles, -> {
		where(:article => true).active_ordered
	}

	scope :inactive_non_articles, -> {
		where(:article => false).archived_ordered
	}

	scope :inactive_articles, -> {
		where(:article => true).archived_ordered
	}


	def self.populate_new_index_dropdown(page)
		contents = page.contents.active_ordered
		end_point = contents.active_ordered.last.index+5

		#[1, 2, 3, 4, 5, 6, 7, 8, 9]
		new_indexes = (1..end_point).map{ |index| index }
		dropdown = new_indexes

		#[1, 2]
		current_indexes = contents.map{ |content| content.index }

		current_indexes.each do |current_index|
			new_indexes.each do |new_index|
				if current_index == new_index
					dropdown -= [current_index]
				end
			end
		end
		return dropdown
	end

	def self.populate_edit_index_dropdown(content)
		contents = content.page.contents.where(:article => content.article).active_ordered

		end_point = contents.last.index+5

		#[1, 2, 3, 4, 5, 6, 7, 8, 9]
		new_indexes = (1..end_point).map{ |index| index }
		dropdown = new_indexes

		#[1, 2]
		current_indexes = contents.map{ |content| content.index }

		current_indexes.each do |current_index|
			new_indexes.each do |new_index|
				if current_index == new_index
					dropdown -= [current_index]
				end
			end
		end
		return dropdown.push(content.index).sort_by(&:to_i)
	end

	def strip_fields
		self.subheading = nil if self.subheading.blank?
		self.description = nil if self.description.blank?
	end

	def check_links_articles
		self.article = self.links.map{|link| link.article }.include?(true)
	end

	def images_presence
		errors.add(:images, "You must add at least one image") unless images.present? || self.links.exists?
	end

end
