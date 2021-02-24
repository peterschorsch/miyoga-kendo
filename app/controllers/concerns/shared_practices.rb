module SharedPractices
    extend ActiveSupport::Concern

    def check_day_for_index(day_of_week)
		days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
		return days.index(day_of_week)+1
    end

    def set_start_end_time(record, params)
    	record.day_of_week_index = check_day_for_index(params.dig("day_of_week"))
    	record.start_time = practice_params.dig("start_time(4i)") + ":" + params.dig("start_time(5i)")
    	record.end_time = practice_params.dig("end_time(4i)") + ":" + params.dig("end_time(5i)")
    end

    def set_contents_fk(record, content)
    	record.content_id = content.id
		record.user_id = current_user.id
    end

    def set_user_id(record, user)
        record.user_id = user.id
    end
end