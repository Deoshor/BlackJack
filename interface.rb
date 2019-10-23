#interface for game
class Interface

  def initialize(game)
    @game = game
  end

  def main_menu
    puts 'Добро пожаловать в игру "Black Jack"'
    puts 'Выберите пункт меню:'
    puts '1. Начать игру'
    puts '0. Выход из игры'
    input = gets.chomp.to_i
    case input
    when 1
      new_game
    when 0
      puts 'Удачи!'
      exit
    end
  end

  def new_game
    print 'Введите свое имя '
    begin
      player_name = gets.strip.capitalize
      raise 'Попробуйте еще раз' if player_name.to_s.empty?
    rescue RuntimeError => e
      puts e.message
      retry
    end
    @game.new_game(player_name)
    game_state
    next_turn
  end

  def next_turn
    print 'Сделайте выбор: (1. Взять карту, 2. Пропустить ход, 3. Открыться): '
    begin
      user_input = gets.to_i
      raise 'Выберите 1, 2 или 3 ' unless [1, 2, 3].include?(user_input)
    rescue RuntimeError => e
      puts e.message
      retry
    end
    case user_input
    when 1
      @game.player.take_card(@game.deck)
      @game.dealer.next_turn(@game.deck)
    when 2
      @game.dealer.next_turn(@game.deck)
    end
    @game.dealer.hidden = false
    system 'clear'
    game_state
    case @game.check_result
    when @game.player
      player_wins
    when @game.dealer
      dealer_wins
    when nil
      draw
    end
    send(@game.check_balance) unless @game.check_balance.nil?
    another_round
  end

  def another_round
    print 'Сыграть еще раз? (1. Да 0. Главное меню) '
    begin
      user_input = gets.to_i
      raise 'Введите 1, если хотите начать сначала' unless [1, 0].include?(user_input)
    rescue RuntimeError => e
      puts e.message
      retry
    end
    case user_input
    when 1
      @game.start_game
      system 'clear'
      game_state
      next_turn
    when 0
      main_menu
    end
  end

  def game_state
    draw_hand(@game.player)
    draw_balance(@game.player)
    @game.dealer.hidden ? draw_hand_hidden(@game.dealer) : draw_hand(@game.dealer)
    draw_balance(@game.dealer)
  end

  def draw_hand(person)
    puts "#{person.name}, в Вашей колоде: #{person.score} очков"
    person.hand.each do |card|
      print "|#{card.card_shirt}|"
    end
    puts
  end

  def draw_balance(person)
    puts "#{person.name}, Ваш баланс: $#{person.balance}"
    puts
  end

  def draw_hand_hidden(person)
    puts "#{person.name}, в колоде Дилера: "
    print '|***| ' * person.hand.size
    puts
    puts
  end

  def player_wins
    puts 'Вы выиграли этот раунд!'
    puts "$#{@game.rate} были добавлены Вам на счет"
    puts
  end

  def dealer_wins
    puts 'Вы проиграли этот раунд!'
    puts "$#{@game.rate} были сняты с Вашего счета"
    puts
  end

  def dealer_lose
    puts 'Вы выиграли эту игру!'
    puts 'Нажмите любую клавишу, чтобы выйти в главное меню'
    gets
    main_menu
  end

  def player_lose
    puts 'Ваш баланс пуст!'
    puts 'Нажмите любую клавишу, чтобы выйти в главное меню'
    gets
    main_menu
  end

  def draw
    puts 'Ничья!'
    puts 'Ваша ставка вернулась к Вам на счет'
  end

end
