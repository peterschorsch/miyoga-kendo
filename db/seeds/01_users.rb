puts "----------CREATE TEST ADMINS/USERS----------"
puts "----------TEST ADMINS----------"
@admin_user = User.create_with(firstname: "Peter", lastname: "Schorsch", active: true, password_digest: User.digest("Peteschorsch1!"), role: "Admin", new_user: false, last_login: DateTime.now-1.week).find_or_create_by(email: "peteschorsch@icloud.com")
puts @admin_user.inspect
@admin_user = User.create_with(firstname: "Jason", lastname: "Toy", active: true, password_digest: User.digest("Jasontoy2!"), role: "Admin", new_user: false, last_login: DateTime.now-2.weeks).find_or_create_by(email: "jasontoy@icloud.com")
puts @admin_user.inspect
@admin_user = User.create_with(firstname: "Vince", lastname: "Chan", active: true, password_digest: User.digest("Vincechan3!"), role: "Admin", new_user: false, last_login: DateTime.now-6.days).find_or_create_by(email: "vincechan@yahoo.com")
puts @admin_user.inspect
@miyoga_user = User.create_with(firstname: "Miyoga", lastname: "Kendo Club", active: true, password_digest: User.digest("MiyogaKendo1!"), role: "Admin", new_user: false, last_login: DateTime.now-1.day).find_or_create_by(email: "miyoga.kendo.kai@gmail.com")
puts @miyoga_user.inspect
@miyoga_address = Address.create_with(location_name: "Japanese Culture Center", address_line_1: "1016 W. Belmont Ave", city: "Chicago", state_id: State.find_by_abbr("IL").id, zip_code: "60657", notes: "https://japaneseculturecenter.com/", user_id: @miyoga_user.id).find_or_create_by(address_line_1: "1016 W. Belmont Ave")
puts @miyoga_address.inspect
image_path = "#{Rails.root}/app/assets/images/practices_page/outside_jcc.jpg"
image_file = File.new(image_path)
Image.create_with(:address_id => @miyoga_address.id, :image => ActionDispatch::Http::UploadedFile.new(:filename => File.basename(image_file), :tempfile => image_file,
    # detect the image's mime type with MIME if you can't provide it yourself.
    :type => MIME::Types.type_for(image_path).first.content_type
  )
).find_or_create_by(address_id: @miyoga_address.id, image_file_name: File.basename(image_file))
image_path = "#{Rails.root}/app/assets/images/practices_page/second_floor_jcc.jpg"
image_file = File.new(image_path)
Image.create_with(:address_id => @miyoga_address.id, :image => ActionDispatch::Http::UploadedFile.new(:filename => File.basename(image_file), :tempfile => image_file,
    # detect the image's mime type with MIME if you can't provide it yourself.
    :type => MIME::Types.type_for(image_path).first.content_type
  )
).find_or_create_by(address_id: @miyoga_address.id, image_file_name: File.basename(image_file))
puts ""

puts "----------TEST USERS----------"
@user = User.create_with(firstname: "John", lastname: "Smith", active: true, password_digest: User.digest("Johnsmith4!"), role: "User", new_user: false, last_login: DateTime.now-2.weeks).find_or_create_by(email: "jsmith@gmail.com")
puts @user.inspect
@user = User.create_with(firstname: "Donald", lastname: "Long", active: true, password_digest: User.digest("Donaldlong5!"), role: "User", new_user: false, last_login: DateTime.now-4.days).find_or_create_by(email: "dlong@yahoo.com")
puts @user.inspect
@user = User.create_with(firstname: "Tom", lastname: "Jones", active: true, password_digest: User.digest("Tomjones6!"), role: "User", new_user: false, last_login: DateTime.now-5.days).find_or_create_by(email: "tjones@msnglobal.net")
puts @user.inspect
puts ""

puts "----------GUEST----------"
@guest = User.create_with(firstname: "Not Logged In", lastname: "User", active: false, password_digest: User.digest("Testpassword1!"), role: "Guest", new_user: false, last_login: DateTime.now-1.day).find_or_create_by(email: "guestuser@gmail.com")
puts @guest.inspect
puts ""
puts ""