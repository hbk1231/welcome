# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "martin@example.com"
    password  "secret"
  end
end
