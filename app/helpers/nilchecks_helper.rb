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
		return tf_check(last_login) ? "n/a" : formatDateTimeWithAt(last_login)
	end

	def link_nil_check(field)
		return tf_check(field) ? "n/a" : (link_to field, field, :class => "link-text", target: '_blank')
	end

	##### CHECK IF IN ASSET PIPELINE ######
	def image_in_asset_pipeline(news)
		File.file? Rails.public_path + "/news_page/#{news.image_file_name}"
	end

end