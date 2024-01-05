FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sequence(:email) { |n| "user#{n}@test.com" }
    password { Faker::Internet.password(min_length: Devise.password_length.min) }
    password_confirmation { password }
    terms_and_conditions { true }

    trait :admin do
      admin { true }
    end

    trait :confirmed do
      confirmed_at { Time.current }
    end

    trait :with_subscription do
      after(:create) do |user, evaluator|
        user.set_payment_processor :fake_processor, allow_fake: true
        user.payment_processor.subscribe(plan: "example")
      end
    end
  end
end
