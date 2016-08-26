class Deck < ApplicationRecord
  has_many :cards#, dependent: :destroy
  belongs_to :game

  after_create :populate_deck
  #attr_accessor :initial_size

  # def initialize
  #   #@cards = []
  #   #@initial_size = initial_size
  #   populate_deck
  # end


  def populate_deck
    # self.initial_size.times do
    #   new_card_class = Card.library.values.sample
    #   new_card = new_card_class.new
    #   self.cards << new_card
    # end
    40.times do
      new_card_type = Card.library.values.sample
      new_card = new_card_type.create
      self.cards << new_card
    end
  end

  # def size
  #   @cards.size
  # end
end
