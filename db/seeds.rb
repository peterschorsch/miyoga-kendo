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
puts "RAN SEEDING IN " + (Time.now - start).to_s + " SECONDS"
