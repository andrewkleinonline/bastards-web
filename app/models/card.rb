class Card < ApplicationRecord
  belongs_to :deck, optional: true
  belongs_to :hand, optional: true
end
