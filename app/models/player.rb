class Player < ApplicationRecord
  has_one :hand#, dependent: :destroy
  has_many :cards, through: :hand
  belongs_to :game
  #has_one :deck, through :game
  after_create :initialize_hand

  def initialize_hand
    self.create_hand
  end

  def draw_card
    drawn_card = self.game.deck.cards.first
    self.game.deck.cards.delete(drawn_card)

    self.hand.cards << drawn_card

    #self.game.deck.cards.first.destroy
  end


  def play_card(card)
    #damage opponent (has a message)
    #do whatever other ability (has a message)
    #discard card
    discard_card(card)
    #draw card
    #display message (combination of above messages) (return value)

  end

  def discard_card(card)
    self.hand.cards.delete(card)
    card.game.trash.cards << card
  end
end
