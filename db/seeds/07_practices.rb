puts "----------PRACTICES PAGE----------"
@content = Content.create_with(heading: "Class Schedule", :index => 1, :archived => false, :article => false, :page_id => Page.named("Classes").id, :user_id => User.admin_accounts.first.id).find_or_create_by(heading: "Class Schedule")
puts @content.inspect
now = DateTime.now
@practice = Practice.create_with(day_of_week: "Sunday", day_of_week_index: 1, start_time: Time.parse("08:30").in_time_zone('Central Time (US & Canada)'), end_time: Time.parse("09:45").in_time_zone('Central Time (US & Canada)'), cost_per_month: "30", content_id: @content.id, :user_id => User.admin_accounts.second.id).find_or_create_by(day_of_week: "Sunday")
puts @practice.inspect
@ractice = Practice.create_with(day_of_week: "Friday", day_of_week_index: 6, start_time: Time.parse("20:30").in_time_zone('Central Time (US & Canada)'), end_time: Time.parse("21:45").in_time_zone('Central Time (US & Canada)'), cost_per_month: "30", content_id: @content.id, :user_id => User.admin_accounts.third.id).find_or_create_by(day_of_week: "Friday")
puts @practice.inspect
puts ""
puts ""