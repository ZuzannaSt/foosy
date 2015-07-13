class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update]


  def index
    @players = Player.all.includes(:matches).decorate
  end

  def show
  end

  def new
    @player = Player.new
  end

  def edit
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to @player, notice: 'Player was successfully created'
    else
      render action: 'new'
    end
  end

  def update
    if @player.update(player_params)
      redirect_to @player, notice: 'Player was successfully updated.'
    else
      render action: 'edit'
    end
  end

  private
    def player_params
      params.require(:player).permit(:first_name, :last_name, :avatar)
    end

    def set_player
      @player = Player.find(params[:id]).decorate
    end
end
