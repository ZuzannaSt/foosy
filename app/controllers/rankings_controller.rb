class RankingsController < ApplicationController

  def index
    @top_players = Player.all.decorate.sort_by{ |player| player.win_rate }.reverse.first(3)
    @top_day = Player.all.decorate.sort_by{ |player| player.win_rate_today }.reverse
    @top_active = Player.all.decorate.sort_by{ |player| player.matches_played }.reverse
  end
end
