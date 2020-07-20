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

puts "GUEST"
@guest = User.create_with(firstname: "Not Logged In", lastname: "User", active: false, password_digest: User.digest("Testpassword1!"), role: "Guest", last_login: DateTime.now-2.weeks).find_or_create_by(email: "guestuser@gmail.com")
puts @guest.inspect
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
@jcc_address = Address.create_with(address_line_1: "1016 W Belmont Ave", city: "Chicago", state_id: @jcc_state.id, zip_code: "60657").find_or_create_by(address_line_1: "1016 W Belmont Ave")
puts @jcc_address.inspect
puts ""

puts "CONTENT"
@about_page_id = Page.named("About").id
@content = Content.create_with(heading: "About Kendo", :description => "Simply put, it is fencing, Japanese style. It is based on the legacy of classical Japanese swordsmanship, that is as old as Japan herself. 'Bushi' or 'samurai' used the sword to establish and maintain order from the 9th to the 19th centuries. These men and women followed an unwritten code called 'Bushido'. Bravery, honesty, and integrity were at its core. Today, the kendo student has the unique opportunity to study an art that has been handed down through the centuries, its theory and methods slowly evolving through generations of great swordsman. Although modern kendo only faintly resembles its feudal origins, it still retains its bushido concepts of dedication, hard work, calm-mindedness, patience, and seizing the moment.<br />Over the years, like most other martial arts of Japan, the emphasis has changed from killing ones enemy to training for self-discipline, and mental physical fitness. Kendo can help develop posture, poise, grace under pressure, agility, quickness, clarity of thought, and the power of concentration.<br />Kendoists use a lightweight split bamboo sword, and a set of protective armor that consists of a helmet, gloves, chest protector, and a waist flap-groin protector. The armor is not needed for the beginners, for they will practice the basic swings of the attacking motions with their 'shinai' (bamboo sword). They learn the correct footwork and then combine it with their swinging strike, together with the 'ki-ai' (shout). Then time is spent attacking and practicing on their seniors. After weeks or months they are finally allowed to wear 'bogu' (armor), and freely practice with others. Finally they can now freely practice the full delivery of their attacks without injury to certain target areas on their opponent's body. Later one can enter tournaments and participate in matches, with judges.<br />Ranking in kendo is similar to other martial ways, with six levels below black belt and ten levels above. In contrast though, there are no colored belts, or outward sign of rank. Certification is under the All U.S. Kendo Federation, and registered in the International Kendo Federation. Also in contrast, the art doesn’t have to compete with many schools and traditions for the self-defense dollar the average person is looking to spend. Instructors in this country rarely profit from their activity, usually giving up their own time, merely for the love of kendo. Kendo is not recommended for those who are looking for a flashy or even a practical style of self-defense.<br />Kendo, like its ancient ancestor, benefits the practitioner forever with the ideals of the formidable warriors of the past. It builds character, adds strength, tones bodies, relieves stress, and teaches one to shoulder responsibility for ones actions. It is for those who desire to become strong in spirit, quick in action, gentle in preserving life, but above all, kendo is from the heart.", :index => 1, :display => true, :page_id => @about_page_id).find_or_create_by(heading: "About Kendo")
puts @content.inspect
@content = Content.create_with(heading: "About Miyoga Kendo", :description => "The JKA of Chicago has been teaching Shotokan karate in Chicago since 1963. Shotokan karate is a traditional Japanese martial art focusing on empty-handed fighting and self-defense.<br />The dojo was established by Walter Nakamoto in 1962 as the Chicago Karate Club. The name was changed in 1963 when Shojiro Sugiyama was invited to come to America from Japan to become head instructor. JKA of Chicago is the headquarters of the Great Lakes Region (Wisconsin, Illinois, Indiana and Ohio) of JKA International.<br />Shojiro Sugiyama was born in 1929 in Japan and studied Judo during his early years. After training in two other styles of karate, Sensei Sugiyama began studying with the Japan Karate Association at the main JKA dojo in Yotsuya, Japan in 1954. Sensei Sugiyama moved to the United States to teach in 1963, at the request of the Chicago Karate Club. Over the years, Sensei Sugiyama has established himself as one of the best teachers that the JKA has produced. His unique ideas on how to develop students have produced some of the highest-quality karateka in the JKA worldwide.<br />As part of his efforts in developing karate practitioners, Sensei Sugiyama has authored several books on karate:<br /><br />25 Shoto-kan Kata (1984, revised 1989)
<br />Basic Principles of Karate (1991)<br />Kimite-gata (1993)<br />Kitoh Karate (1996)<br />Aura, Ki and Healing (2000)<br /><br />Choyokan<br />In 1979, Sugiyama Sensei invited Yutaka Miyazaki Sensei to teach Kendo at Sugiyama Dojo. Miyazaki Sensei founded the Choyokan Kendo Dojo and Sugiyama Dojo was the home of the Choyokan until the mid-eighties.<br /><br />Miyoga Kendo Club<br />Miyoga Kendo Club was founded in 1998 as the Sugiyama Dojo Kendo Kai and was initially formed to provide kendo training to senior karate sempai and instructors of the Japan Karate Association of Chicago. Over time, the club has expanded and today is open to anyone interested in practicing kendo.The Miyoga Kendo Club is a small and dedicated group of Sugiyama Sensei’s senior karate students and instructors who practice and enjoy Kendo as a supplement to karate training.", :index => 2, :display => true, :page_id => @about_page_id).find_or_create_by(heading: "About Miyoga Kendo")
puts @content.inspect
puts ""

@content = Content.create_with(heading: "Class Schedule", :index => 1, :display => true, :page_id => Page.named("Classes").id).find_or_create_by(heading: "Class Schedule")
puts @content.inspect
puts ""

@event_page_id = Page.named("Events").id
@uwm_rec_address = Address.create_with(address_line_1: "702 West Johnson Street", city: "Madison", state_id: State.find_by_abbr("WI").id, zip_code: "53706").find_or_create_by(address_line_1: "702 West Johnson Street")
puts @uwm_rec_address.inspect
puts ""
@uwm_rec_contact = Contact.create_with(name: "Office of Admissions and Recruitment", email: "memberships@recsports.wisc.edu", phone: "6082623742", website: "https://recwell.wisc.edu/", address_id: @uwm_rec_address.id).find_or_create_by(name: "Office of Admissions and Recruitment")
puts @uwm_rec_contact.inspect
puts ""
@event = Event.create_with(title: "2020 MWKF Summer Camp", start_date: Date.new(2020, 7, 31), end_date: Date.new(2020, 8, 2), address_id: @uwm_rec_address.id, description: "Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.").find_or_create_by(title: "2020 MWKF Summer Camp")
puts @event.inspect
puts ""

@detroit_address = Address.create_with(address_line_1: "2436 West Lincoln Street", city: "Birmingham", state_id: State.find_by_abbr("MI").id, zip_code: "48009").find_or_create_by(address_line_1: "2436 West Lincoln Street")
puts @detroit_address.inspect
puts ""
@detroit_contact = Contact.create_with(name: "Seaholm High School", phone: "2482033700", address_id: @detroit_address.id).find_or_create_by(name: "Seaholm High School")
puts @detroit_contact.inspect
puts ""
@event = Event.create_with(title: "2020 Detroit Taikai", start_date: Date.new(2020, 2, 15), end_date: Date.new(2020, 2, 16), address_id: @detroit_address.id, description: "Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.").find_or_create_by(title: "2020 Detroit Taikai")
puts @event.inspect
puts ""

puts "CLASS SCHEDULE"
now = DateTime.now
@class_schedule = ClassSchedule.create_with(day_of_week: "Sunday", start_time: Time.parse("06:30").in_time_zone('Central Time (US & Canada)'), end_time: Time.parse("07:45").in_time_zone('Central Time (US & Canada)'), cost_per_month: "30", address_id: @jcc_address.id, content_id: @content.id).find_or_create_by(day_of_week: "Sunday")
puts @class_schedule.inspect
@class_schedule = ClassSchedule.create_with(day_of_week: "Friday", start_time: Time.parse("20:30").in_time_zone('Central Time (US & Canada)'), end_time: Time.parse("21:45").in_time_zone('Central Time (US & Canada)'), cost_per_month: "30", address_id: @jcc_address.id, content_id: @content.id).find_or_create_by(day_of_week: "Friday")
puts @class_schedule.inspect
puts ""

puts "CONTACT"
@miyoga = Contact.create_with(name: "Miyoga Kendo Club", email: "miyoga.kendo.kai@gmail.com", notes: "Contact Us:", :club => true, :dojo_name => false, :dojo_location => false, address_id: @jcc_address.id).find_or_create_by(name: "Miyoga Kendo Club")
puts @miyoga.inspect
puts ""
@jcc = Contact.create_with(name: "Japanese Culture Center", email: "info@japaneseculturecenter.com", phone: "7735253141", website: "https://japaneseculturecenter.com/", notes: "To learn more about the Japanese Culture Center visit:", :club => false, :dojo_name => true, :dojo_location => true, address_id: @jcc_address.id).find_or_create_by(name: "Japanese Culture Center")
puts @jcc.inspect
puts ""

@resources_page_id = Page.named("Resources").id
puts "RESOURCES"
@content = Content.create_with(heading: "Equipment", :index => 1, :display => true, :page_id => @resources_page_id).find_or_create_by(heading: "Equipment")
puts @content.inspect
puts ""
@link = Link.create_with(name: "E-Bogu", :link => "https://www.e-bogu.com/", :image_link => "e_bogu.png", :index => 1, display_logo: true, :content_id => @content.id).find_or_create_by(name: "E-Bogu")
puts @link.inspect
puts ""
@link = Link.create_with(name: "Tozando", :link => "https://www.tozandoshop.com/", :image_link => "tozando.jpg", :index => 2, display_logo: true, :content_id => @content.id).find_or_create_by(name: "Tozando")
puts @link.inspect
puts ""
@link = Link.create_with(name: "Maruyama", :link => "https://maruyamakendosupply.com/", :image_link => "maruyama.jpg", :index => 3,  display_logo: true, :content_id => @content.id).find_or_create_by(name: "Maruyama")
puts @link.inspect
puts ""
@link = Link.create_with(name: "Kendo Star", :link => "https://kendostar.com/", :image_link => "kendo_star.jpeg", :index => 4, display_logo: true, :content_id => @content.id).find_or_create_by(name: "Kendo Star")
puts @link.inspect
puts ""

@content = Content.create_with(heading: "Federations", :index => 2, :display => true, :page_id => @resources_page_id).find_or_create_by(heading: "Federations")
puts @content.inspect
puts ""
@link = Link.create_with(name: "Midwest Kendo Federation (MWKF)", :link => "https://midwestkendofederation.wordpress.com/", display_logo: true, :image_link => "mwkf.jpg", :index => 1, :content_id => @content.id).find_or_create_by(name: "Midwest Kendo Federation (MWKF)")
puts @link.inspect
puts ""
@link = Link.create_with(name: "All United States Kendo Federation (AUSKF)", :link => "http://www.auskf.info/index.htm", display_logo: true, :image_link => "auskf.png", :index => 2, :content_id => @content.id).find_or_create_by(name: "All United States Kendo Federation (AUSKF)")
puts @link.inspect
puts ""

@content = Content.create_with(heading: "Kata", description: "Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.", :index => 1, :display => true, :page_id => @resources_page_id).find_or_create_by(heading: "Kata")
puts @content.inspect
puts ""
@link = Link.create_with(name: "Kenshi 24/7", :link => "https://kenshi247.net/", :index => 1, article: true, :content_id => @content.id).find_or_create_by(name: "Kenshi 24/7")
puts @link.inspect
puts ""
@content = Content.create_with(heading: "How to tie your Hakama", description: "Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.", :index => 2, :display => true, :page_id => @resources_page_id).find_or_create_by(heading: "How to tie your Hakama")
puts @content.inspect
puts ""
@link = Link.create_with(name: "Kenshi 24/7 copy", :link => "https://kenshi247.net/", :index => 2, article: true, :content_id => @content.id).find_or_create_by(name: "Kenshi 24/7 copy")
puts @link.inspect
puts ""


puts ""
puts "RAN SEEDING IN " + (Time.now - start).to_s + " SECONDS"
