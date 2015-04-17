class Player < ActiveRecord::Base

  has_many :player_matches
  has_many :matches, through: :player_matches

  validates :first_name, :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }, length: { minimum: 2, message: "minimum 2 letters" }

    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  def full_name
    "#{first_name} #{last_name}"
  end

  def score(match)
    score = player_matches.find_by(match_id: match.id).result

    if score.blank?
      score = score.to_i
    else
      score
    end
  end

  def goal!(match)
    result = player_matches.find_by(match_id: match.id).result

    if result.blank?
      scored = 1
    else
      scored = result + 1
    end
    player_matches.find_by(match_id: match.id).update_attribute(:result, scored)
  end

  def has_won?(match)
    score(match) >= 10
  end

  def matches_played
    matches.count
  end

  def matches_won
    matches_won = []

    matches.each do |match|
      if has_won?(match)
        matches_won << match
      end
    end
    matches_won.count
  end

  def goals_scored
    scored = 0

    matches.each do |match|
      scored += score(match)
    end
    scored
  end

  def goals_lost
    scored = 0
    lost = 0

    matches.each do |match|
      match.players.each do |player|
        if score(match) == player.score(match)
          scored += score(match)
        else
          lost += player.score(match)
        end
      end
    end
    lost
  end

  def win_rate
    if matches_played > 5
      ((goals_scored.to_f - goals_lost) / matches_played).round(2)
    else
      0
    end
  end

  def matches_played_today
    matches.played_today.count
  end

  def goals_scored_today
    scored_today = 0

    matches.played_today.each do |match|
      scored_today += score(match)
    end
    scored_today
  end

  def goals_lost_today
    scored = 0
    lost = 0

    matches.played_today.each do |match|
      match.players.each do |player|
        if score(match) == player.score(match)
          scored += score(match)
        else
          lost += player.score(match)
        end
      end
    end
    lost
  end

  def win_rate_today
    if matches_played_today == 0
      0
    else
      ((goals_scored_today.to_f - goals_lost_today) / matches_played_today).round(2)
    end
  end
end
