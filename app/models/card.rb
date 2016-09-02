class Card < ApplicationRecord
  belongs_to :deck, optional: true
  belongs_to :hand, optional: true
  belongs_to :trash, optional: true

  delegate :player, to: :hand, :allow_nil => true
  delegate :game, to: :player

  before_create :initialize_card_attributes

  @@library = {
    1 => Thief,
    2 => Jerk
  }

  def self.library
    @@library
  end

  def initialize_card_attributes

  end

  def ability
    [self.game.players.find_by(is_active?: true), self.game.players.find_by(is_active?: false)]

  end
end
