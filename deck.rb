#playing deck
class Deck
  attr_reader :cards

  def initialize
    @cards = []
    collect
    shuffle
  end

  def collect
    Card::FACES.each do |face|
      Card::SHIRTS.each do |shirt, value|
        @cards << Card.new(shirt, value, face)
      end
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def take_card
    @cards.slice!(-1)
  end

end
