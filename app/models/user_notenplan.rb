class UserNotenplan < ActiveRecord::Base
  belongs_to :notenplan
  belongs_to :user
end
