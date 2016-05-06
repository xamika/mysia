class Notenplan < ActiveRecord::Base
  has_many :marks, dependent: :delete_all
  has_many :user_notenplans, dependent: :delete_all
  has_many :users, through: :user_notenplans
end
