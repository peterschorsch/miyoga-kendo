namespace :database do

	desc "Resets all records in tables"
	task :clean_tables => [:environment] do |t, args|
		if !Rails.env.production?
			DatabaseCleaner.clean_with :truncation
		end
	end

end
