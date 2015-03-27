class HomeController < ApplicationController
  def index
    @top_players = Player.all.sort_by{ |player| player.win_rate }.reverse.first(3)
    @recent_games = Match.all.order("date DESC").first(8)
  end
end
