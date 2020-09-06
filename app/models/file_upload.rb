class FileUpload < ApplicationRecord
	belongs_to :announcement

    has_attached_file :pdf

    validates_attachment :pdf, :presence => true, content_type: { content_type: "application/pdf" }
end
