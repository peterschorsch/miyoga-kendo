puts "----------EVENTS PAGE----------"
@event_page_id = Page.named("Events").id
@event = Event.create_with(title: "2020 MWKF Summer Camp", start_date: Date.new(2020, 7, 31), end_date: Date.new(2020, 8, 2), :user_id => User.admin_accounts.third.id, page_id: @event_page_id, description: "Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.").find_or_create_by(title: "2020 MWKF Summer Camp")
puts @event.inspect
@uwm_rec_address = Address.create_with(location_name: "Office of Admissions and Recruitment", address_line_1: "702 West Johnson Street", city: "Madison", state_id: State.find_by_abbr("WI").id, zip_code: "53706", event_id: @event.id, user_id: User.admin_accounts.second.id).find_or_create_by(address_line_1: "702 West Johnson Street")
puts @uwm_rec_address.inspect
puts ""
@event = Event.create_with(title: "2020 Detroit Taikai", start_date: Date.new(2020, 2, 15), end_date: Date.new(2020, 2, 16), :user_id => User.admin_accounts.first.id, page_id: @event_page_id, description: "Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.").find_or_create_by(title: "2020 Detroit Taikai")
puts @event.inspect
@detroit_address = Address.create_with(location_name: "Seaholm High School", address_line_1: "2436 West Lincoln Street", city: "Birmingham", state_id: State.find_by_abbr("MI").id, zip_code: "48009", event_id: @event.id, user_id: User.admin_accounts.third.id).find_or_create_by(address_line_1: "2436 West Lincoln Street")
puts @detroit_address.inspect
puts ""
puts ""