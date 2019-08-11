start = Time.now
puts "Started seeding"
@user = User.new(firstname: "Test", lastname: "User", email: "testuser@gmail.com", password: BCrypt::Password.create("foooobar"))
puts @user.inspect
puts "Ran seeding in " + (Time.now - start).to_s + " seconds"