class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :first_player_goal, :second_player_goal]
  before_action :set_players, only: [:show, :first_player_goal, :second_player_goal]

  def index
    @matches = Match.all.order( "date DESC" ).paginate(:per_page => 10, :page => params[:page]).decorate
  end

  def show
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

  def first_player_goal
    @first_player.goal!(@match)
    flash[:success] = 'Goal for the first player!'

    respond_to do |format|
      format.html { redirect_to @match }
      format.js
    end
  end

  def second_player_goal
    @second_player.goal!(@match)
    flash[:notice] = 'Goal for the second player!'

    respond_to do |format|
      format.html { redirect_to @match }
      format.js
    end
  end

  private
    def match_params
      params.require(:match).permit(:date, player_ids:[])
    end

    def set_match
      @match = Match.find(params[:id]).decorate
    end

    def set_players
      @first_player = @match.players.first.decorate
      @second_player = @match.players.last.decorate
    end
end
