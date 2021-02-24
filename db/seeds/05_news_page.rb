puts "----------NEWS PAGE----------"
@news_page_id = Page.named("News").id
@announcement = Announcement.create_with(heading: "2020 Dragonboat Race", description: "The Chinese Dragon Boat Race dates back to over 2,000 years and is a popular sport amongst Chinese and Asian communities all over the world. Started in 2000, the Chicago Dragon Boat Race for Literacy is a family-fun activity enjoyed by visitors from all over the city and surrounding suburbs.", link: "https://www.ccc-foundation.org/dragon-boat-race-for-literacy/", pinned: true, :user_id => User.admin_accounts.third.id, page_id: @news_page_id).find_or_create_by(heading: "2020 Dragonboat Race")
puts @announcement.inspect
image_path = "#{Rails.root}/app/assets/images/news_page/bokken.jpg"
image_file = File.new(image_path)
Image.create_with(:announcement_id => @announcement.id, :image => ActionDispatch::Http::UploadedFile.new(:filename => File.basename(image_file), :tempfile => image_file,
    # detect the image's mime type with MIME if you can't provide it yourself.
    :type => MIME::Types.type_for(image_path).first.content_type
  )
).find_or_create_by(announcement_id: @announcement.id, image_file_name: File.basename(image_file))
image_path = "#{Rails.root}/app/assets/images/news_page/suburito.jpg"
image_file = File.new(image_path)
Image.create_with(:announcement_id => @announcement.id, :image => ActionDispatch::Http::UploadedFile.new(:filename => File.basename(image_file), :tempfile => image_file,
    # detect the image's mime type with MIME if you can't provide it yourself.
    :type => MIME::Types.type_for(image_path).first.content_type
  )
).find_or_create_by(announcement_id: @announcement.id, image_file_name: File.basename(image_file))
@announcement.images.each do |image|
  puts image.inspect
end
puts ""

@announcement = Announcement.create_with(heading: "Upcoming Practice (August 21)", description: "Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.", :user_id => User.admin_accounts.second.id, page_id: @news_page_id).find_or_create_by(heading: "Upcoming Pactice (August 21)")
puts @announcement.inspect

image_path = "#{Rails.root}/app/assets/images/news_page/bokken.jpg"
image_file = File.new(image_path)
Image.create_with(:announcement_id => @announcement.id, :image => ActionDispatch::Http::UploadedFile.new(:filename => File.basename(image_file), :tempfile => image_file,
    # detect the image's mime type with MIME if you can't provide it yourself.
    :type => MIME::Types.type_for(image_path).first.content_type
  )
).find_or_create_by(announcement_id: @announcement.id, image_file_name: File.basename(image_file))

image_path = "#{Rails.root}/app/assets/images/news_page/suburito.jpg"
image_file = File.new(image_path)
Image.create_with(:announcement_id => @announcement.id, :image => ActionDispatch::Http::UploadedFile.new(:filename => File.basename(image_file), :tempfile => image_file,
    # detect the image's mime type with MIME if you can't provide it yourself.
    :type => MIME::Types.type_for(image_path).first.content_type
  )
).find_or_create_by(announcement_id: @announcement.id, image_file_name: File.basename(image_file))
@announcement.images.each do |image|
  puts image.inspect
end
puts ""

@announcement = Announcement.create_with(heading: "Upcoming Practice (August 23)", description: "Please make sure to bring a bokken to practice.", :user_id => User.admin_accounts.second.id, page_id: @news_page_id).find_or_create_by(heading: "Upcoming Pactice (August 23)")
puts @announcement.inspect
puts ""
puts ""