FactoryGirl.define do
  factory :feedback do
    name Faker::Name.name
    email Faker::Internet.email
    text "My Text"
  end
end
