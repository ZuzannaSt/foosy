class Player < ActiveRecord::Base
  validates :first_name, :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }, length: { minimum: 2, message: "minimum 2 letters" }


  has_many :player_matches
  has_many :matches, through: :player_matches


  def full_name
    "#{first_name} #{last_name}"
  end

  def score
    player_matches[0].result.to_i
  end

  def goal!
    if player_matches[0].result == nil
      player_matches[0].result = 1
    else
      player_matches[0].result += 1
    end
    player_matches[0].save
  end

  def has_won?
    score == 10
  end
end
