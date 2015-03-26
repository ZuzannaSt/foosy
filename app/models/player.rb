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
    score(match) == 10
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

  def win_rate
    if matches_played == 0
      0
    else
      (matches_won.to_f / matches_played.to_f).round(2)
    end
  end

  def won_today
    won_today = []

    matches.played_today.each do |match|
      if has_won?(match)
      won_today << match
      end
    end
    won_today.count
  end
end
