module Test

  def test
    cards = Deck.new
    @cards_p << card_player = cards.give_card
    @cards_p << card_player = cards.give_card
    @cards_d << card_dealer = cards.give_card
    @cards_d << card_dealer = cards.give_card
    ###
    player = Player.new('player')
    dealer = Dealer.new
    @deposit_p = deposit_p = player.deposit_p
    @deposit_d = deposit_d = dealer.deposit_d

  end

end
