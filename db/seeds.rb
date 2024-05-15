# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seedの実行を開始しました"

Admin.find_or_create_by!(email: ENV['ADMIN_ADDRESS']) do |admin|
  admin.password = "eeeeee"
end

User.find_or_create_by!(email: "olivia@example.com") do |user|
  user.name = "Olivia"
  user.password = "password"
  user.is_active = true
end

User.find_or_create_by!(email: "james@example.com") do |user|
  user.name = "James"
  user.password = "password"
  user.is_active = true
end

User.find_or_create_by!(email: "lucas@example.com") do |user|
  user.name = "Lucas"
  user.password = "password"
  user.is_active = false
end

User.find_or_create_by!(email: "ray@example.com") do |user|
  user.name = "ray"
  user.password = "password"
  user.is_active = true
end

Balloon.find_or_create_by!(content: "資格勉強2日目！！") do |balloon|
  balloon.user_id = 1
  balloon.color_status = 1
end

Balloon.find_or_create_by!(content: "筋トレ継続3日！まだまだ続けます") do |balloon|
  balloon.user_id = 2
  balloon.color_status = 2
end

Balloon.find_or_create_by!(content: "受験まで後100日！今日は息抜き") do |balloon|
  balloon.user_id = 3
  balloon.color_status = 3
end

Balloon.find_or_create_by!(content: "朝早く起きることが出来た！時間作れたので今日はお菓子作りをするよ！！") do |balloon|
  balloon.user_id = 4
  balloon.color_status = 4
end

Balloon.find_or_create_by!(content: "資格勉強30日目！！") do |balloon|
  balloon.user_id = 1
  balloon.color_status = 5
end

Balloon.find_or_create_by!(content: "筋トレ継続522日！まだまだ続けます") do |balloon|
  balloon.user_id = 2
  balloon.color_status = 6
end

Balloon.find_or_create_by!(content: "受験まで後8005日！今日は息抜き") do |balloon|
  balloon.user_id = 3
  balloon.color_status = 7
end

Balloon.find_or_create_by!(content: "朝早く起きることが出来た！時間作れたので今日はお買い物をする！！") do |balloon|
  balloon.user_id = 4
  balloon.color_status = 8
end

Sticker.find_or_create_by!(message: "いいね！")
Sticker.find_or_create_by!(message: "素晴らしい！")
Sticker.find_or_create_by!(message: "その調子！")
Sticker.find_or_create_by!(message: "Excellent！")
Sticker.find_or_create_by!(message: "天才か？")
Sticker.find_or_create_by!(message: "GO！GO！")

puts "seedの実行を完了しました"