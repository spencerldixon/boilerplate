FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sequence(:email) { |n| "user#{n}@test.com" }
    password { Faker::Internet.password(min_length: 8) }
    password_confirmation { password }
    terms_and_conditions { true }

    trait :admin do
      admin { true }
    end

    trait :confirmed do
      confirmed_at { Time.now }
    end
  end
end
