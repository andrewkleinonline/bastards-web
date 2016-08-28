class Game < ApplicationRecord
  has_one :deck#, dependent: :destroy
  has_one :trash#, dependent: :destroy
  has_many :players#, dependent: :destroy
  belongs_to :user, optional: true

  after_create :initialize_game_assets

  def initialize_game_assets
    @player1 = self.players.create(name: self.user.name, is_human?: true, is_active?: true)
    @player2 = self.players.create(name: "CPU", is_human?: false)
    self.create_deck
    self.create_trash

    5.times do
      @player1.draw_card
      @player2.draw_card
    end
    #draw_initial_cards(@player1)
    #draw_initial_cards(@player2)
  end

  def damage_opponent(attacker, damage)
    opponent = self.players.find_by(is_active?: false)
    opponent.health -= damage
    opponent.save
    "#{attacker.name} reduced #{opponent.name}'s health to #{opponent.health}!"
  end


end
