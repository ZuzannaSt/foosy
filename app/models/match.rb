class Match < ActiveRecord::Base
  has_many :players, through: :player_matches
end
