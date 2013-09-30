# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
  	user
  	title "Drone"
  	teaser "Delivery like a boss."
  	description "Can't touch this."
  	goal 1000000
  end
end
