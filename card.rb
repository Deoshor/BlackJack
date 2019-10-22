#playing card
class Card
  attr_reader :shirt
  attr_accessor :value

  SPADES = "^"
  HEART = "<3"
  DIAMOND = "<>"
  CLUB = "+"

  FACES = [SPADES, HEART, DIAMOND, CLUB].freeze
  SHIRTS = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8,
             '9' => 9, '10' => 10, 'J' => 10, 'Q' => 10, 'K' => 10, 'A' => 11 }.freeze

  def initialize(shirt, value, face)
    @shirt = shirt
    @value = value
    @face = face
  end

  def ace?
    @shirt.to_s.include?("A")
  end

end
