FactoryGirl.define do
  factory :user do
    email
    full_name { Faker::Name.name }
    password "123456"
    password_confirmation { password }
    confirmed_at 1.hour.ago
    role "user"
  end

  trait :not_confirmed do
    confirmed_at nil

    after(:create) do |user|
      user.update(confirmation_sent_at: 3.days.ago)
    end
  end

  trait :admin do
    after(:create) do |user|
      user.update(role: "admin")
    end
  end
end
