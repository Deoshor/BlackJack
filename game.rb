#class of game
class Game
  attr_reader :player, :dealer, :bank, :deck, :rate
  RATE = 10

  def initialize(player, dealer, deck)
    @player = player
    @dealer = dealer
    @deck = deck
    @rate = RATE
    @bank = 0
  end

  def new_game(player_name)
    @player = Player.new(player_name)
    @dealer = Dealer.new
    start_game
  end

  def start_game
    @player.hand = []
    @dealer.hand = []
    @player.score = 0
    @dealer.score = 0
    @deck = Deck.new
    2.times { @player.take_card(@deck) }
    2.times { @dealer.take_card(@deck) }
  end

  def check_result
    if @player.points > @dealer.points && @player.points <= 21
      player_wins
    elsif @player.points > 21 && @dealer.points > 21 || @player.points == @dealer.points
      draw
    elsif @player.points > 21 && @dealer.points <= 21
      dealer_wins
    elsif @player.points < @dealer.points && @dealer.points <= 21
      dealer_wins
    elsif @player.points < @dealer.points && @dealer.points > 21
      player_wins
    end
  end

  def make_rate
    @player.balance -= @rate
    @dealer.balance -= @rate
    @bank = @rate * 2
  end

  def player_wins
    @player.balance += @bank
  end

  def dealer_wins
    @dealer.balance += @bank
  end

  def draw
    @player.balance += @bank
    @dealer.balance += @bank
  end

end
