class Player < ActiveRecord::Base
  has_many :matches, through: :player_matches
end
