# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Game
game = Game.create

#Players
andrew = game.players.create(name: "Andrew", is_human?: true)
troy = game.players.create(name: "Troy", is_human?: true)

cpu1 = game.players.create(name: "CPU 1")
cpu2 = game.players.create(name: "CPU 2")

#Hands

andrew.create_hand
#troy.hand.build
cpu1.create_hand
#cpu2.hand.build

#Deck
game_deck = game.create_deck

#Cards
for i in 1..30 do
  new_card = Card.create(power: i, name: "Thief", number: 1)
  game_deck.cards << new_card
end

for i in 31..35 do
  new_card = Card.create(power: i, name: "Thief", number: 1)
  andrew.hand.cards << new_card
end

for i in 36..40 do
  new_card = Card.create(power: i, name: "Thief", number: 1)
  cpu1.hand.cards << new_card
end
