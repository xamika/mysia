require 'faker'

FactoryGirl.define do
  factory :notenplan do |f|
    f.name Faker::Name.name
    f.description "description"
  end
end
