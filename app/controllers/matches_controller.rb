class MatchesController < ApplicationController

  def index
    @matches = Match.all  
  end

  def show
    @match = Match.find(params[:id])
    set_players
    puts @first_player.score
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)

    if @match.save
      redirect_to @match, notice: 'Match was successfully created.'
    else
      render action: 'new'
    end
  end


  private    
    def match_params
      params.require(:match).permit(:date, player_ids:[])
    end

    def set_players
      @first_player = @match.players.first
      @second_player = @match.players.last
    end
end
