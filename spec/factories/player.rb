FactoryGirl.define do
  factory :player do
    sequence(:handle) { |n| "user#{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password "Password"
  end
end
