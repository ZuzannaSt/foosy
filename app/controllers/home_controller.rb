class HomeController < ApplicationController
  def index
    @top_players = Player.all.decorate.sort_by{ |player| player.win_rate }.reverse.first(3)
    @recent_games = Match.order("date DESC").decorate.first(8)
  end
end
