#main class for roles 
class Person
  attr_accessor :balance, :hand, :card, :score
  attr_reader :deck, :player, :dealer

  def initialize(*params)
    @balance = 100
    @hand = []
    @score = 0
  end

  def take_card(card)
    @card = deck.take_card
    @hand << @card
    @hand += @card.value
  end

  def ace
    @hand.each do |card|
      if limit? && card.ace?
        card.value = 1
        @score -= 10
      end
    end
  end

  def limit?
    @score > 21
  end

end
