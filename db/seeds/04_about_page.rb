puts "----------ABOUT PAGE----------"
@about_page_id = Page.named("About").id
@content = Content.create_with(heading: "About Kendo", :subheading => nil, :index => 1, :display_content_on_page => true, :article => false, :page_id => @about_page_id, :user_id => User.admin_accounts.first.id, :description => "Simply put, it is fencing, Japanese style. It is based on the legacy of classical Japanese swordsmanship, that is as old as Japan herself. 'Bushi' or 'samurai' used the sword to establish and maintain order from the 9th to the 19th centuries. These men and women followed an unwritten code called 'Bushido'. Bravery, honesty, and integrity were at its core. Today, the kendo student has the unique opportunity to study an art that has been handed down through the centuries, its theory and methods slowly evolving through generations of great swordsman. Although modern kendo only faintly resembles its feudal origins, it still retains its bushido concepts of dedication, hard work, calm-mindedness, patience, and seizing the moment.\r\n\r\nOver the years, like most other martial arts of Japan, the emphasis has changed from killing ones enemy to training for self-discipline, and mental physical fitness. Kendo can help develop posture, poise, grace under pressure, agility, quickness, clarity of thought, and the power of concentration.\r\nKendoists use a lightweight split bamboo sword, and a set of protective armor that consists of a helmet, gloves, chest protector, and a waist flap-groin protector. The armor is not needed for the beginners, for they will practice the basic swings of the attacking motions with their 'shinai' (bamboo sword). They learn the correct footwork and then combine it with their swinging strike, together with the 'ki-ai' (shout). Then time is spent attacking and practicing on their seniors. After weeks or months they are finally allowed to wear 'bogu' (armor), and freely practice with others. Finally they can now freely practice the full delivery of their attacks without injury to certain target areas on their opponent's body. Later one can enter tournaments and participate in matches, with judges.\r\n\r\nRanking in kendo is similar to other martial ways, with six levels below black belt and ten levels above. In contrast though, there are no colored belts, or outward sign of rank. Certification is under the All U.S. Kendo Federation, and registered in the International Kendo Federation. Also in contrast, the art doesn’t have to compete with many schools and traditions for the self-defense dollar the average person is looking to spend. Instructors in this country rarely profit from their activity, usually giving up their own time, merely for the love of kendo. Kendo is not recommended for those who are looking for a flashy or even a practical style of self-defense.\r\n\r\nKendo, like its ancient ancestor, benefits the practitioner forever with the ideals of the formidable warriors of the past. It builds character, adds strength, tones bodies, relieves stress, and teaches one to shoulder responsibility for ones actions. It is for those who desire to become strong in spirit, quick in action, gentle in preserving life, but above all, kendo is from the heart.").find_or_create_by(heading: "About Kendo")
image_path = "#{Rails.root}/app/assets/images/about_page/kendo_strike.jpg"
image_file = File.new(image_path)

Image.create_with(:content_id => @content.id, :image => ActionDispatch::Http::UploadedFile.new(:filename => File.basename(image_file), :tempfile => image_file,
    # detect the image's mime type with MIME if you can't provide it yourself.
    :type => MIME::Types.type_for(image_path).first.content_type
  )
).find_or_create_by(image_file_name: File.basename(image_file))

image_path = "#{Rails.root}/app/assets/images/about_page/old_kendo_postcard.jpg"
image_file = File.new(image_path)
Image.create_with(:content_id => @content.id, :image => ActionDispatch::Http::UploadedFile.new(:filename => File.basename(image_file), :tempfile => image_file,
    # detect the image's mime type with MIME if you can't provide it yourself.
    :type => MIME::Types.type_for(image_path).first.content_type
  )
).find_or_create_by(image_file_name: File.basename(image_file))
puts @content.inspect
@content.images.each do |image|
  puts image.inspect
  puts ""
end

@content = Content.create_with(heading: "About Miyoga Kendo", :subheading => nil, :index => 2, :display_content_on_page => true, :article => false, :page_id => @about_page_id, :user_id => User.admin_accounts.second.id, :description => "The JKA of Chicago has been teaching Shotokan karate in Chicago since 1963. Shotokan karate is a traditional Japanese martial art focusing on empty-handed fighting and self-defense.\r\n\r\nThe dojo was established by Walter Nakamoto in 1962 as the Chicago Karate Club. The name was changed in 1963 when Shojiro Sugiyama was invited to come to America from Japan to become head instructor. JKA of Chicago is the headquarters of the Great Lakes Region (Wisconsin, Illinois, Indiana and Ohio) of JKA International.\r\n\r\nShojiro Sugiyama was born in 1929 in Japan and studied Judo during his early years. After training in two other styles of karate, Sensei Sugiyama began studying with the Japan Karate Association at the main JKA dojo in Yotsuya, Japan in 1954. Sensei Sugiyama moved to the United States to teach in 1963, at the request of the Chicago Karate Club. Over the years, Sensei Sugiyama has established himself as one of the best teachers that the JKA has produced. His unique ideas on how to develop students have produced some of the highest-quality karateka in the JKA worldwide.\r\n\r\nAs part of his efforts in developing karate practitioners, Sensei Sugiyama has authored several books on karate:\r\n\r\n25 Shoto-kan Kata (1984, revised 1989)\r\n\r\nBasic Principles of Karate (1991)\r\n\r\nKimite-gata (1993)\r\n\r\nKitoh Karate (1996)\r\n\r\nAura, Ki and Healing (2000)\r\n\r\n\r\n\r\nChoyokan\r\n\r\nIn 1979, Sugiyama Sensei invited Yutaka Miyazaki Sensei to teach Kendo at Sugiyama Dojo. Miyazaki Sensei founded the Choyokan Kendo Dojo and Sugiyama Dojo was the home of the Choyokan until the mid-eighties.\r\n\r\n\r\n\r\nMiyoga Kendo Club\r\n\r\nMiyoga Kendo Club was founded in 1998 as the Sugiyama Dojo Kendo Kai and was initially formed to provide kendo training to senior karate sempai and instructors of the Japan Karate Association of Chicago. Over time, the club has expanded and today is open to anyone interested in practicing kendo.The Miyoga Kendo Club is a small and dedicated group of Sugiyama Sensei’s senior karate students and instructors who practice and enjoy Kendo as a supplement to karate training.").find_or_create_by(heading: "About Miyoga Kendo")
image_path = "#{Rails.root}/app/assets/images/about_page/sensei.jpg"
image_file = File.new(image_path)
Image.create_with(:content_id => @content.id, :image => ActionDispatch::Http::UploadedFile.new(:filename => File.basename(image_file), :tempfile => image_file,
    # detect the image's mime type with MIME if you can't provide it yourself.
    :type => MIME::Types.type_for(image_path).first.content_type
  )
).find_or_create_by(image_file_name: File.basename(image_file))
puts @content.inspect
@content.images.each do |image|
  puts image.inspect
  puts ""
end
puts ""