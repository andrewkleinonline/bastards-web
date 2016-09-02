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
  end

  def damage_opponent(damage)
    attacker = self.players.find_by(is_active?: true)
    opponent = self.players.find_by(is_active?: false)
    damage_player(opponent, damage)
    "#{attacker.name} reduced #{opponent.name}'s health to #{opponent.health}!"
  end

  def damage_player(player, damage)
    player.health -= damage
    player.health = 0 if player.health < 0
    player.save
  end



end
