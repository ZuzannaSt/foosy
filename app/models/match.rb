class Match < ActiveRecord::Base
  has_many :player_matches
  has_many :players, through: :player_matches
end
