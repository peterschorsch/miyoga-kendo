puts "----------SOCIAL MEDIA----------"
image_path = "#{Rails.root}/app/assets/images/logos/gmail.png"
image_file = File.new(image_path)
site_name = "Miyoga Gmail"
@social_media = SocialMedium.create_with(site_name: site_name, site_link: "https://mail.google.com/mail/u/0/#inbox", user_id: User.admin_accounts.second.id,
    :image => ActionDispatch::Http::UploadedFile.new(:filename => File.basename(image_file),:tempfile => image_file,
    # detect the image's mime type with MIME if you can't provide it yourself.
    :type => MIME::Types.type_for(image_path).first.content_type
  )
).find_or_create_by(site_name: site_name)
puts @social_media.inspect

image_path = "#{Rails.root}/app/assets/images/logos/facebook.png"
image_file = File.new(image_path)
site_name = "Facebook Group"
@social_media = SocialMedium.create_with(site_name: site_name, site_link: "https://www.facebook.com/groups/672754536102008/", user_id: User.admin_accounts.first.id,
    :image => ActionDispatch::Http::UploadedFile.new(:filename => File.basename(image_file),:tempfile => image_file,
    # detect the image's mime type with MIME if you can't provide it yourself.
    :type => MIME::Types.type_for(image_path).first.content_type
  )
).find_or_create_by(site_name: site_name)
puts @social_media.inspect

image_path = "#{Rails.root}/app/assets/images/logos/dropbox.png"
image_file = File.new(image_path)
site_name = "Miyoga Dropbox"
@social_media = SocialMedium.create_with(site_name: site_name, site_link: "https://www.dropbox.com/home/Miyoga%20Kendo%20Kai", user_id: User.admin_accounts.third.id,
    :image => ActionDispatch::Http::UploadedFile.new(:filename => File.basename(image_file),:tempfile => image_file,
    # detect the image's mime type with MIME if you can't provide it yourself.
    :type => MIME::Types.type_for(image_path).first.content_type
  )
).find_or_create_by(site_name: site_name)
puts @social_media.inspect
puts ""
puts ""