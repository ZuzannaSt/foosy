class PlayerMatch < ActiveRecord::Base
  belongs_to :match
  belongs_to :player  

  before_validation :set_result

  validates :result, presence: true, numericality: true

  def set_result
    update_attribute(:result, 0)
  end
end
