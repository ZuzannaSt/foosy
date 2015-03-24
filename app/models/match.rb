class Match < ActiveRecord::Base
  before_save :has_two_players?

  has_many :player_matches
  has_many :players, through: :player_matches

  scope :ongoing, -> { where("date > ?", Time.now )}

  def has_two_players?
    players.length == 2
  end

  def finish
    update_attribute(:date, Time.now)    
  end
end
