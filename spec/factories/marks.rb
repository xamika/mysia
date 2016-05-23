require 'faker'

FactoryGirl.define do
  factory :mark do
    mark 1.5
    weighting 1.5
    shorttest false
    notenplan nil
    subject nil
  end
end
