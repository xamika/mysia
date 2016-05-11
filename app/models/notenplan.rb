class Notenplan < ActiveRecord::Base
  validates :name, presence: true
  has_many :marks, dependent: :delete_all
  has_many :user_notenplans, dependent: :delete_all
  has_many :users, through: :user_notenplans
  belongs_to :owner, class_name: 'User'
end
