puts "----------HOME PAGE----------"
@home_page_id = Page.named("Home").id
@content = Content.create_with(heading: "Top Image - About Miyoga Kendo", :subheading => nil, :index => 1, :archived => false, :article => false, :page_id => @home_page_id, :user_id => User.admin_accounts.first.id, :description => nil).find_or_create_by(heading: "Top Image - About Miyoga Kendo")
puts @content.inspect
image_path = "#{Rails.root}/app/assets/images/home_page/group_practice_shot.jpg"
image_file = File.new(image_path)

Image.create_with(:content_id => @content.id, :image => ActionDispatch::Http::UploadedFile.new(:filename => File.basename(image_file), :tempfile => image_file,
    # detect the image's mime type with MIME if you can't provide it yourself.
    :type => MIME::Types.type_for(image_path).first.content_type
  )
).find_or_create_by(image_file_name: File.basename(image_file))


@content = Content.create_with(heading: "Bottom Image - Contact Us", :subheading => nil, :index => 2, :archived => false, :article => false, :page_id => @home_page_id, :user_id => User.admin_accounts.first.id, :description => nil).find_or_create_by(heading: "Bottom Image - Contact Us")
puts @content.inspect

image_path = "#{Rails.root}/app/assets/images/home_page/group_post_practice.jpg"
image_file = File.new(image_path)

Image.create_with(:content_id => @content.id, :image => ActionDispatch::Http::UploadedFile.new(:filename => File.basename(image_file), :tempfile => image_file,
    # detect the image's mime type with MIME if you can't provide it yourself.
    :type => MIME::Types.type_for(image_path).first.content_type
  )
).find_or_create_by(image_file_name: File.basename(image_file))
puts ""
puts ""