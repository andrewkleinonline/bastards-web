class GamesController < ApplicationController

  before_action :set_game, only: [:show, :update]
  before_action :set_player, only: [:show, :update]

  def new
    @messages = flash[:messages]
    @user = current_user
    @game = Game.new
  end

  def create
    @game = current_user.games.create

    redirect_to game_path(@game)
  end

  def show
    @messages = flash[:messages]
  end

  def update
    if @player.is_human?
      card_choice = Card.find(params[:card_id])
    else
      card_choice = @player.hand.cards.sample
    end
    messages = @player.make_move(card_choice)

    flash[:messages] = messages
    if @player.is_winner?
      redirect_to new_game_path
    else
      redirect_to game_path(@game)
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def set_player
    @player = @game.players.find_by(is_active?: true)
  end

end
