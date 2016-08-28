class GamesController < ApplicationController

  before_action :set_game, only: [:show, :update]
  before_action :set_player, only: [:show, :update]

  def new
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
    #human going
    if @player.is_human?
      card_choice = Card.find(params[:card_id])
    else
      card_choice = @player.hand.cards.sample
    end
    messages = @player.make_move(card_choice)
    messages.flatten!

    flash[:messages] = messages
    redirect_to game_path(@game)
    # #make move switches the active player
    #
    # #cpu going
    # @player = Player.find_by(is_active?: true)
    # card_choice = @player.hand.cards.sample
    # @messages << @player.make_move(card_choice)
    #
    # @player = Player.find_by(is_active?: true)
    # @messages.flatten
    # render :show

    # @play_card_message = @player.play_card(card_choice)
    # @draw_card_message = @player.draw_card
    #redirect_to game_path(params[:id])
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def set_player
    @player = @game.players.find_by(is_active?: true)
    #active key
  end

end
