# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pledge do
    user_id 1
    project_id 1
    amount 1
  end
end
