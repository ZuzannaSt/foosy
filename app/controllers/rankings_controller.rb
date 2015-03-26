class RankingsController < ApplicationController

  def index
    @players = Player.all.sort_by{ |player| player.win_rate }.reverse
  end
end


