class Deck < ApplicationRecord
  has_many :cards
  belongs_to :game
end
