# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seedの実行を開始しました"

Admin.find_or_create_by!(email: ENV['ADMIN_ADDRESS']) do |admin|
  admin.password = ENV['ADMIN_PASSWORD']
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

User.find_or_create_by!(email: "test@example.com") do |user|
  user.name = "test"
  user.password = "password"
  user.is_active = true
end

3.times do
  Balloon.create(content: "test", user_id: 4, color_status: rand(1..12), created_at: Time.current.ago(9.month))
end

3.times do
  Balloon.create(content: "test", user_id: 4, color_status: rand(1..12), created_at: Time.current.ago(7.month))
end

3.times do
  Balloon.create(content: "test", user_id: 4, color_status: rand(1..12), created_at: Time.current.ago(4.month))
end

15.times do
  Balloon.create(content: "test", user_id: 4, color_status: rand(1..12), created_at: Time.current.ago(3.month))
end

28.times do
  Balloon.create(content: "test", user_id: 4, color_status: rand(1..12), created_at: Time.current.ago(2.month))
end

20.times do
  Balloon.create(content: "test", user_id: 4, color_status: rand(1..12), created_at: Time.current.prev_month)
end

for n in 1..20 do

  Balloon.find_or_create_by!(content: "資格勉強#{n}日目！！") do |balloon|
    balloon.user_id = 1
    balloon.color_status = rand(1..12)
  end

  Balloon.find_or_create_by!(content: "筋トレ継続5#{n}日！まだまだ続けます") do |balloon|
    balloon.user_id = 2
    balloon.color_status = rand(1..12)
  end

  Balloon.find_or_create_by!(content: "受験まで後800#{n}日！今日は息抜き") do |balloon|
    balloon.user_id = 3
    balloon.color_status = rand(1..12)
  end

end

Sticker.find_or_create_by!(message: "いいね！")
Sticker.find_or_create_by!(message: "すごい！")
Sticker.find_or_create_by!(message: "素敵！")
Sticker.find_or_create_by!(message: "Excellent！")
Sticker.find_or_create_by!(message: "天才か？")

puts "seedの実行を完了しました"