module NilchecksHelper
	### RETURNS A BOOLEAN ###
	def tf_check(field)
		return field.blank?
	end

	##### RETURNS N/A #####
	def nil_check(field)
		return tf_check(field) ? raw("<i>n/a</i>") : field
	end

	##### RETURNS N/A - FOR CONTENT DESCRIPTION #####
	def description_nil_check(field)
		return tf_check(field) ? raw("<i>n/a</i>") : field.html_safe
	end

	##### RETURNS N/A - FOR USER LAST LOGIN #####
	def user_nil_last_login(last_login)
		return tf_check(last_login) ? "n/a" : formateDateTimeWithAt(last_login)
	end

end