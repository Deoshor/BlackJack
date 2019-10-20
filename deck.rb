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

  def take_card
    @cards.slice!(-1)
  end
  
end
