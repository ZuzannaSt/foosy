class RankingsController < ApplicationController

  def index
    @top_players = Player.all.sort_by{ |player| player.win_rate }.reverse.first(3)
    @top_day = Player.all.sort_by{ |player| player.won_today }.reverse
    @top_active = Player.all.sort_by{ |player| player.matches_played }.reverse
  end
end


