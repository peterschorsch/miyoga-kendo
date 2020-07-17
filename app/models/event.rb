class Event < ApplicationRecord
	has_many :contents
	belongs_to :address

end
