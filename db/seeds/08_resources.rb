puts "----------RESOURCES PAGE----------"
@resources_page_id = Page.named("Resources").id
@content = Content.create_with(heading: "Equipment", :index => 1, :display_content_on_page => true, :article => false, :page_id => @resources_page_id, :user_id => User.admin_accounts.second.id).find_or_create_by(heading: "Equipment")
puts @content.inspect
@link = Link.create_with(name: "E-Bogu", :link => "https://www.e-bogu.com/", :index => 1, :image_file_name=>"e_bogu.png", :image_content_type=>"application/png", :image_file_size=>13605, :image_updated_at=>DateTime.now, :content_id => @content.id, :user_id => User.admin_accounts.first.id).find_or_create_by(name: "E-Bogu")
puts @link.inspect
@link = Link.create_with(name: "Tozando", :link => "https://www.tozandoshop.com/", :index => 2, :image_file_name=>"tozando.jpg", :image_content_type=>"application/jpg", :image_file_size=>7830, :image_updated_at=>DateTime.now, :content_id => @content.id, :user_id => User.admin_accounts.second.id).find_or_create_by(name: "Tozando")
puts @link.inspect
@link = Link.create_with(name: "Maruyama", :link => "https://maruyamakendosupply.com/", :index => 3, :image_file_name=>"maruyama.jpeg", :image_content_type=>"application/jpeg", :image_file_size=>9501, :image_updated_at=>DateTime.now, :content_id => @content.id, :user_id => User.admin_accounts.third.id).find_or_create_by(name: "Maruyama")
puts @link.inspect
@link = Link.create_with(name: "Kendo Star", :link => "https://kendostar.com/", :index => 4, :image_file_name=>"kendo_star.jpeg", :image_content_type=>"application/jpeg", :image_file_size=>4889, :image_updated_at=>DateTime.now, :content_id => @content.id, :user_id => User.admin_accounts.first.id).find_or_create_by(name: "Kendo Star")
puts @link.inspect
puts ""

puts "----------FEDERATIONS----------"
@content = Content.create_with(heading: "Federations", :index => 2, :display_content_on_page => true, :article => false, :page_id => @resources_page_id, :user_id => User.admin_accounts.third.id).find_or_create_by(heading: "Federations")
puts @content.inspect
@link = Link.create_with(name: "Midwest Kendo Federation (MWKF)", :link => "https://midwestkendofederation.wordpress.com/", :index => 1, :image_file_name=>"mwkf.jpg", :image_content_type=>"application/jpg", :image_file_size=>28791, :image_updated_at=>DateTime.now, :content_id => @content.id, :user_id => User.admin_accounts.second.id).find_or_create_by(name: "Midwest Kendo Federation (MWKF)")
puts @link.inspect
@link = Link.create_with(name: "All United States Kendo Federation (AUSKF)", :link => "http://www.auskf.info/index.htm", :index => 2, :image_file_name=>"auskf.png", :image_content_type=>"application/png", :image_file_size=>14912, :image_updated_at=>DateTime.now, :content_id => @content.id, :user_id => User.admin_accounts.first.id).find_or_create_by(name: "All United States Kendo Federation (AUSKF)")
puts @link.inspect
puts ""

puts "----------KATA----------"
@content = Content.create_with(:heading => "Kata 7", :description => "A very interesting article about kata number 7.", :index => 1, :display_content_on_page => true, :article => true, :page_id => @resources_page_id, :user_id => User.admin_accounts.first.id).find_or_create_by(heading: "Kata 7")
puts @content.inspect
@link = Link.create_with(name: "Kenshi 24/7", :link => "https://kenshi247.net/", :index => 1, :image_file_name=>"kata_7.jpg", :image_content_type=>"application/jpg", :image_file_size=>111832, :image_updated_at=>DateTime.now, :article => true, :content_id => @content.id, :user_id => User.admin_accounts.second.id).find_or_create_by(name: "Kenshi 24/7")
puts @link.inspect
puts ""

puts "----------TIE HAKAMA----------"
@content = Content.create_with(:heading => "How to tie your Hakama", :description => "Checkout this article on how to tie your hakama.", :index => 2, :display_content_on_page => true, :article => true, :page_id => @resources_page_id, :user_id => User.admin_accounts.second.id).find_or_create_by(heading: "How to tie your Hakama")
puts @content.inspect
@link = Link.create_with(name: "Kenshi 24/7 copy", :link => "https://www.kendo-world.com/", :index => 2, :image_file_name=>"hakama.jpg", :image_content_type=>"application/jpg", :image_file_size=>268068, :image_updated_at=>DateTime.now, :article => true, :content_id => @content.id, :user_id => User.admin_accounts.third.id).find_or_create_by(name: "Kenshi 24/7 copy")
puts @link.inspect
puts ""
puts ""