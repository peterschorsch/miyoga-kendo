start = Time.now
puts "Started seeding"
@admin_user = User.find_or_create_by(firstname: "Test", lastname: "Admin", email: "testadmin@gmail.com", password: BCrypt::Password.create("testadmin"), role: "Admin")
puts @admin_user.inspect
@user = User.find_or_create_by(firstname: "Test", lastname: "User", email: "testuser@gmail.com", password: BCrypt::Password.create("testuser"), role: "User")
puts @user.inspect
puts "Ran seeding in " + (Time.now - start).to_s + " seconds"