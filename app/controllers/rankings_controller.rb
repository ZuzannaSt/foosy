class RankingsController < ApplicationController

  def index
    @top_players = Player.all.decorate.sort_by{ |player| player.win_rate }.reverse.first(5)
    @top_day = Player.all.decorate.sort_by{ |player| player.win_rate_today }.reverse.first(8)
    @top_active = Player.all.decorate.sort_by{ |player| player.matches_played }.reverse.first(10)

    @goals_scored = PlayerMatch.group(:result).count
    @win_rate = Player.all.collect{|player| [player.first_name, player.win_rate.to_s]}
    @matches_played = Player.all.collect{|player| [player.first_name, player.matches_played.to_s]}
  end
end
