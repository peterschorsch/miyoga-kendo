start = Time.now
puts "STARTED SEEDING"
puts ""

### CREATE TEST USERS ###
puts "CREATE TEST USERS"

## ADMINS ##
puts "ADMINS"
@admin_user = User.create_with(firstname: "Peter", lastname: "Schorsch", active: true, password_digest: User.digest("Peteschorsch1!"), role: "Admin", last_login: DateTime.now-1.week).find_or_create_by(email: "peteschorsch@icloud.com")
puts @admin_user.inspect
@admin_user = User.create_with(firstname: "Jason", lastname: "Toy", active: true, password_digest: User.digest("Jasontoy2!"), role: "Admin", last_login: DateTime.now-1.week).find_or_create_by(email: "jasontoy@icloud.com")
puts @admin_user.inspect
@admin_user = User.create_with(firstname: "Vince", lastname: "Chan", active: true, password_digest: User.digest("Vincechan3!"), role: "Admin", last_login: DateTime.now-1.week).find_or_create_by(email: "vincechan@yahoo.com")
puts @admin_user.inspect
puts ""

puts "USERS"
## USERS ##
@user = User.create_with(firstname: "John", lastname: "Smith", active: true, password_digest: User.digest("Johnsmith4!"), role: "User", last_login: DateTime.now-2.weeks).find_or_create_by(email: "jsmith@gmail.com")
puts @user.inspect
@user = User.create_with(firstname: "Donald", lastname: "Long", active: true, password_digest: User.digest("Donaldlong5!"), role: "User", last_login: DateTime.now-2.weeks).find_or_create_by(email: "dlong@yahoo.com")
puts @user.inspect
@user = User.create_with(firstname: "Tom", lastname: "Jones", active: true, password_digest: User.digest("Tomjones6!"), role: "User", last_login: DateTime.now-2.weeks).find_or_create_by(email: "tjones@msnglobal.net")
puts @user.inspect
puts ""

puts "SOCIAL MEDIA"
@social_media = SocialMedium.create_with(site_name: "Miyoga Gmail", site_link: "https://mail.google.com/mail/u/0/#inbox", image_link: "gmail.png", user_id: @admin_user.id).find_or_create_by(site_name: "Miyoga Gmail")
puts @social_media.inspect
@social_media = SocialMedium.create_with(site_name: "Facebook Group", site_link: "https://www.facebook.com/groups/672754536102008/", image_link: "facebook.png", user_id: @admin_user.id).find_or_create_by(site_name: "Facebook Group")
puts @social_media.inspect
@social_media = SocialMedium.create_with(site_name: "Miyoga Dropbox", site_link: "https://www.dropbox.com/home/Miyoga%20Kendo%20Kai", image_link: "dropbox.png", user_id: @admin_user.id).find_or_create_by(site_name: "Miyoga Dropbox")
puts @social_media.inspect
puts ""

puts "PAGES"
admin_user_id = User.active_users.first.id
@page = Page.create_with(name: "About", path: "abouts_path", index: 1, user_id: admin_user_id).find_or_create_by(name: "About")
puts @page.inspect
@page = Page.create_with(name: "Classes", path: "practices_path", index: 2, user_id: admin_user_id).find_or_create_by(name: "Classes")
puts @page.inspect
@page = Page.create_with(name: "Events", path: "events_path", index: 3, user_id: admin_user_id).find_or_create_by(name: "Events")
puts @page.inspect
@page = Page.create_with(name: "Resources", path: "helpful_links_path", index: 4, user_id: admin_user_id).find_or_create_by(name: "Resources")
puts @page.inspect
puts ""

puts "STATES"
state_list = Array[ ["AK", "Alaska"], ["AL", "Alabama"], ["AR", "Arkansas"], ["AS", "American Samoa"], ["AZ", "Arizona"], 
                ["CA", "California"], ["CO", "Colorado"], ["CT", "Connecticut"], ["DC", "District of Columbia"], ["DE", "Delaware"], 
                ["FL", "Florida"], ["GA", "Georgia"], ["GU", "Guam"], ["HI", "Hawaii"], ["IA", "Iowa"], ["ID", "Idaho"], 
                ["IL", "Illinois"], ["IN", "Indiana"], ["KS", "Kansas"], ["KY", "Kentucky"], ["LA", "Louisiana"], 
                ["MA", "Massachusetts"], ["MD", "Maryland"], ["ME", "Maine"], ["MI", "Michigan"], ["MN", "Minnesota"], 
                ["MO", "Missouri"], ["MS", "Mississippi"], ["MT", "Montana"], ["NC", "North Carolina"], ["ND", "North Dakota"], 
                ["NE", "Nebraska"], ["NH", "New Hampshire"], ["NJ", "New Jersey"], ["NM", "New Mexico"], ["NV", "Nevada"], 
                ["NY", "New York"], ["OH", "Ohio"], ["OK", "Oklahoma"], ["OR", "Oregon"], ["PA", "Pennsylvania"], 
                ["PR", "Puerto Rico"], ["RI", "Rhode Island"], ["SC", "South Carolina"], ["SD", "South Dakota"], 
                ["TN", "Tennessee"], ["TX", "Texas"], ["UT", "Utah"], ["VA", "Virginia"], ["VI", "Virgin Islands"], 
                ["VT", "Vermont"], ["WA", "Washington"], ["WI", "Wisconsin"], ["WV", "West Virginia"], ["WY", "Wyoming"] ]

state_list.each do |abbr, name|
	State.create_with(abbreviation: abbr, name: name).find_or_create_by(abbreviation: abbr, name: name)
end
puts "SEEDED all 50 States"
puts ""

@jcc_state = State.find_by_abbr("IL")
puts "ADDRESS"
@jcc_address = Address.create_with(address_line_1: "1016 W Belmont Ave", city: "Chicago", state_id: @jcc_state.id, zip_code: "60657", :dojo_flag => true, :current_dojo_flag => true).find_or_create_by(address_line_1: "1016 W Belmont Ave")
puts @jcc_address.inspect
puts ""

puts "CONTENT"
@content = Content.create_with(heading: "Class Schedule", :index => 1, :display => true, :page_id => Page.named("Classes").id).find_or_create_by(heading: "Class Schedule")
puts @content.inspect
puts ""

puts "CLASS SCHEDULE"
now = DateTime.now
@class_schedule = ClassSchedule.create_with(day_of_week: "Sunday", start_time: Time.parse("06:30").in_time_zone('Central Time (US & Canada)'), end_time: Time.parse("07:45").in_time_zone('Central Time (US & Canada)'), cost_per_month: "30", :address_id => @jcc_address.id, :content_id => @content.id).find_or_create_by(day_of_week: "Sunday")
puts @class_schedule.inspect
@class_schedule = ClassSchedule.create_with(day_of_week: "Friday", start_time: Time.parse("20:30").in_time_zone('Central Time (US & Canada)'), end_time: Time.parse("21:45").in_time_zone('Central Time (US & Canada)'), cost_per_month: "30", :address_id => @jcc_address.id, :content_id => @content.id).find_or_create_by(day_of_week: "Friday")
puts @class_schedule.inspect
puts ""

puts "CONTACT"
@miyoga = Contact.create_with(name: "Miyoga Kendo Club", email: "miyoga.kendo.kai@gmail.com", notes: "Contact Us:", address_id: @jcc_address.id).find_or_create_by(name: "Miyoga Kendo Club")
puts @miyoga.inspect
puts ""
@jcc = Contact.create_with(name: "Japanese Culture Center", email: "info@japaneseculturecenter.com", phone: "7735253141", website: "https://japaneseculturecenter.com/", notes: "To learn more about the Japanese Culture Center visit:", address_id: @jcc_address.id).find_or_create_by(name: "Japanese Culture Center")
puts @jcc.inspect
puts ""


puts ""
puts "RAN SEEDING IN " + (Time.now - start).to_s + " SECONDS"
