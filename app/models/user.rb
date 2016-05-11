class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :user_notenplans, dependent: :delete_all
  has_many :notenplans, through: :user_notenplans, dependent: :delete_all
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
