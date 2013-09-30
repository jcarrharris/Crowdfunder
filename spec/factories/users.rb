# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	first_name "Cherry"
    last_name "Shah"
    sequence(:email) {|n| "cherry#{n}@bitmaker.com" }
    password "password"
  end
end
