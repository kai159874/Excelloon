FactoryBot.define do
  factory :balloon do
    content { Faker::Lorem.characters(number: 25) }
    color_status { Faker::Number.between(from: 1, to: 12) }
  end
end