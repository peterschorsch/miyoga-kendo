puts "----------PAGES----------"
admin_user_id = User.active_accounts.first.id
@page = Page.create_with(name: "About", path: "abouts_path", admin_path: "admin_abouts_path", index: 1, user_id: User.admin_accounts.first.id).find_or_create_by(name: "About")
puts @page.inspect
@page = Page.create_with(name: "Classes", path: "practices_path", admin_path: "admin_practices_path", index: 2, user_id: User.admin_accounts.third.id).find_or_create_by(name: "Classes")
puts @page.inspect
@page = Page.create_with(name: "News", path: "announcements_path", admin_path: "admin_announcements_path", index: 3, user_id: User.admin_accounts.second.id).find_or_create_by(name: "News")
puts @page.inspect
@page = Page.create_with(name: "Events", path: "events_path", admin_path: "admin_events_path", index: 4, user_id: User.admin_accounts.first.id).find_or_create_by(name: "Events")
puts @page.inspect
@page = Page.create_with(name: "Resources", path: "resources_path", admin_path: "admin_resources_path", index: 5, user_id: User.admin_accounts.third.id).find_or_create_by(name: "Resources")
puts @page.inspect
puts ""
puts ""