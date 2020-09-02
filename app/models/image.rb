class Image < ApplicationRecord
	belongs_to :content, optional: true
	belongs_to :link, optional: true

    has_attached_file :image

    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

    scope :search_by_file_name, -> (file_name) {
		where(:image_file_name => file_name)
	}
end
