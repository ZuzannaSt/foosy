class Match < ActiveRecord::Base

  has_many :player_matches
  has_many :players, through: :player_matches
  
  validates :date, presence: true

  before_save :has_two_players?
  
  scope :most_recent, -> { order(created_at: :desc).limit(10) }
  scope :played_today, -> { where("date >= ? AND date < ?", Date.today, Date.tomorrow) }

  def has_two_players?
    players.length == 2
  end

  def finish
    update_attribute(:date, Time.now)    
  end

  def result(player1, player2, match)
    "#{ player1.score(match) } : #{ player2.score(match) }"
  end
end
