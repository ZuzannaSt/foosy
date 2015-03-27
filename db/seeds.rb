# Players
player1 = Player.find_or_create_by(first_name: "Suzanne", last_name: "Moose")
player1.avatar = File.new("#{Rails.root}/app/assets/images/flat_avatars/suzanne.png")
player1.save!
puts 'Created player: ' << player1.full_name

player2 = Player.find_or_create_by(first_name: "Bobby", last_name: "McFurry")
player2.avatar = File.new("#{Rails.root}/app/assets/images/flat_avatars/bob.png")
player2.save!
puts 'Created player: ' << player2.full_name

player3 = Player.find_or_create_by(first_name: "Tom", last_name: "Hank")
player3.avatar = File.new("#{Rails.root}/app/assets/images/flat_avatars/tom.png")
player3.save!
puts 'Created player: ' << player3.full_name

player4 = Player.find_or_create_by(first_name: "Jarry", last_name: "James")
player4.avatar = File.new("#{Rails.root}/app/assets/images/flat_avatars/jarry.png")
player4.save!
puts 'Created player: ' << player4.full_name

player5 = Player.find_or_create_by(first_name: "Mike", last_name: "DonSpike")
player5.avatar = File.new("#{Rails.root}/app/assets/images/flat_avatars/mike.png")
player5.save!
puts 'Created player: ' << player5.full_name

player6 = Player.find_or_create_by(first_name: "Jonathan", last_name: "Dong")
player6.avatar = File.new("#{Rails.root}/app/assets/images/flat_avatars/jonathan.png")
player6.save!
puts 'Created player: ' << player6.full_name



#Matches
match1 = Match.find_or_create_by(date: Time.now)
match1.players = [player1, player2]
match1.save!
puts 'Created match for: ' << match1.players[0].full_name, match1.players[1].full_name

match2 = Match.find_or_create_by(date: Time.now + 1.day)
match2.players = [player1, player3]
match2.save!
puts 'Created match for: ' << match2.players[0].full_name, match2.players[1].full_name

match3 = Match.find_or_create_by(date: Time.now + 1.day)
match3.players = [player2, player3]
match3.save!
puts 'Created match for: ' << match3.players[0].full_name, match3.players[1].full_name
