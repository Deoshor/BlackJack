#class for dealer
class Dealer < Person

  def initialize
    super
    @name = 'Dealer'
  end

  def next_turn(card)
    take_card(card) if another_card?
  end

  def another_card?
    if @score >= 21
      false
    elsif @score >= 17 && @score <= 21
      false
    else
      true
    end
  end
end
