class Garde < ActiveRecord::Base
  belongs_to :notenplan
  belongs_to :subject
end
