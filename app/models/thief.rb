class Thief < Card
#  after_create :initialize_thief_attributes

  def initialize_card_attributes
    super
    self.name = "Thief"
    self.power = 2
    self.number = 1
  end
end
