class GamesController < ApplicationController

  before_action :set_game, only: [:show]
  before_action :set_player, only: [:show]

  def new
    @user = user_object
    @game = Game.new
  end

  def create
    @game = user_object.games.create

    redirect_to game_path(@game)
  end

  def show

  end

  def update
    card_choice = Card.find(params[:card_id])
    card_choice.player.play_card(card_choice)
    redirect_to game_path(params[:id])
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def set_player
    @player = @game.players.first
  end

end
