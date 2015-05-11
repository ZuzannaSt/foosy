class PlayerMatch < ActiveRecord::Base
  belongs_to :match
  belongs_to :player

  validates :result, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

  def set_result
    update_attribute(:result, 0)
  end
end
