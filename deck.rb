#playing deck
class Deck
  attr_reader :cards

  def initialize
    @cards = []
    collect
    shuffle
  end

  def collect
    Card::CARDS.each do |shirt, value|
      @cards << Card.new(shirt,value)
    end
  end

  def shuffle
    @cards.shuffle!
  end
end
