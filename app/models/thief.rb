class Thief < Card
#  after_create :initialize_thief_attributes

  def initialize_card_attributes
    super
    self.name = "Thief"
    self.power = 6
    self.number = 1
  end

  def ability
    players = super
    #byebug

    stolen_card = players[1].hand.cards.sample
    #drawn_card = self.game.deck.cards.first
    players[1].hand.cards.delete(stolen_card)
    #self.game.deck.cards.delete(drawn_card)
    players[0].hand.cards << stolen_card
    #self.hand.cards << drawn_card
    #byebug
    "#{players[0].name} stole a #{stolen_card.name}"

  end

end
