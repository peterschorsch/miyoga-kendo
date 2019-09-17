module ApplicationHelper
	def nil_check(field)
		return field.nil? || field.blank?
	end
end
