class Mark < ActiveRecord::Base
  belongs_to :notenplan
  belongs_to :subject
  validates :weighting, :inclusion => {:in => 1..100}, numericality: { only_integer: true }, allow_nil: true

end
