class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :first_player_goal, :second_player_goal]

  def index
    @matches = Match.all  
  end

  def show
    @match = Match.find(params[:id])
    @first_player = @match.players.first
    @second_player = @match.players.last
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)

    if @match.has_two_players?
      if @match.save
        redirect_to @match, notice: 'Match was successfully created.'
      else
        render action: 'new'
      end
    else
      render action: 'new', notice: 'Match has to have two players.'
    end
  end

  def first_player_goal
    @first_player.goal!
    redirect_to @match, notice: 'Goal for the first player!'
  end

  def second_player_goal
    @second_player.goal!
    redirect_to @match, notice: 'Goal for the second player!'
  end

  private    
    def match_params
      params.require(:match).permit(:date, player_ids:[])
    end

    def set_match
      @match = Match.find(params[:id])
      @first_player = @match.players.first
      @second_player = @match.players.last
    end
end
