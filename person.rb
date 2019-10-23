#main class for roles
class Person
  attr_accessor :balance, :hand, :card, :score
  attr_reader :deck, :player, :dealer, :name

  def initialize
    @balance = 100
    @hand = []
    @score = 0
  end

  def take_card(card)
    @card = card.take_card
    @hand << @card
    @score += @card.value
    ace if limit?
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
