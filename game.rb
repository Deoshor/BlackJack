#class of game
class Game
  attr_reader :player, :dealer, :bank, :deck, :rate, :balance
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
    @dealer.hidden = true
    @deck = Deck.new
    make_rate
    2.times { @player.take_card(@deck) }
    2.times { @dealer.take_card(@deck) }
  end

  def check_result
    if @player.score > @dealer.score && @player.score <= 21
      player_wins
    elsif @player.score > 21 && @dealer.score > 21 || @player.score == @dealer.score
      draw
    elsif @player.score > 21 && @dealer.score <= 21
      dealer_wins
    elsif @player.score < @dealer.score && @dealer.score <= 21
      dealer_wins
    elsif @player.score < @dealer.score && @dealer.score > 21
      player_wins
    end
  end

  def check_balance
   return :dealer_lose if @dealer.balance.zero?
   return :player_lose if @player.balance.zero?
 end

  def make_rate
    @player.balance -= @rate
    @dealer.balance -= @rate
    @bank = @rate * 2
  end

  def player_wins
    @player.balance += @bank
    @player
  end

  def dealer_wins
    @dealer.balance += @bank
    @dealer
  end

  def draw
    @player.balance += @bank
    @dealer.balance += @bank
    nil
  end

end
