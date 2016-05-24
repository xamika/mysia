require 'faker'

FactoryGirl.define do
  factory :user_notenplan do
    user nil
    notenplan nil
    admin true
  end

end
