class PlayerMatch < ActiveRecord::Base
  validates :result, presence: true, numericality: true

  belongs_to :match
  belongs_to :player  
end
