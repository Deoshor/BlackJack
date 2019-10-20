require_relative './deck.rb'
require_relative './card.rb'
require_relative './person.rb'
require_relative './player.rb'
require_relative './dealer.rb'
require_relative './game.rb'
require_relative './interface.rb'


@player = Player.new('Player')
@dealer = Dealer.new
@deck = Deck.new
@game = Game.new(@player, @dealer, @deck)
@interface = Interface.new(@game)
@interface.main_menu
