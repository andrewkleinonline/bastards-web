class Player < ApplicationRecord
  has_one :hand#, dependent: :destroy
  has_many :cards, through: :hand
  belongs_to :game
  #has_one :deck, through :game
  after_create :initialize_hand

  #attr_accessor :opponent

  def initialize_hand
    self.create_hand
  end

  def make_move(card)
    messages = self.play_card(card)
    drawn_card_message = self.draw_card
    messages << drawn_card_message if self.is_human?
    self.game.players.find_by(is_active?: false).update(is_active?: true)
    self.update(is_active?: false)

    messages
  end

  def play_card(card)
    messages = ["#{self.name} played #{card.name}"]
    #damage opponent (has a message)
    messages << self.game.damage_opponent(self, card.power)
    #do whatever other ability (has a message)

    discard_card(card)
    messages
  end

  def draw_card
    drawn_card = self.game.deck.cards.first
    self.game.deck.cards.delete(drawn_card)

    self.hand.cards << drawn_card

    "You drew a #{drawn_card.name}"
  end

  def discard_card(card)
    self.hand.cards.delete(card)
    card.game.trash.cards << card
  end

end
