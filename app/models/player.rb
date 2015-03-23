class Player < ActiveRecord::Base
  has_many :player_matches
  has_many :matches, through: :player_matches

  def full_name
    "#{first_name} #{last_name}"
  end
end
