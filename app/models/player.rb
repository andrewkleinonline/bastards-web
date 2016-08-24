class Player < ApplicationRecord
  has_one :hand
  has_many :cards, through: :hand
  belongs_to :game
  #has_one :deck, through :game

end
