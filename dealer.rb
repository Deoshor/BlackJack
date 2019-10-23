#class for dealer
class Dealer < Person
  attr_accessor :hidden

  def initialize
    super()
    @name = 'Dealer'
    @hidden = true
  end

  def next_turn(card)
    take_card(card) if another_card?
  end

  def another_card?
    (@score >= 21) &&  (@score >= 17 && @score <= 21) ? false : true
  end

end
