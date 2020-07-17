start = Time.now
puts "STARTED SEEDING"
puts ""

### CREATE TEST USERS ###
puts "CREATE TEST USERS"
##password_digest: #{User.digest('foobar')} )
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
puts "RAN SEEDING IN " + (Time.now - start).to_s + " SECONDS"
