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
    
  end


end
