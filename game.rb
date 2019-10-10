require_relative './test.rb'
class Game
  include Test
  attr_accessor :cards_p, :cards_d, :deposit_p, :deposit_d, :score
  attr_reader :name, :deck, :card

  def initialize
    @cards_p = []
    @cards_d = []
    @score = []
  end

  def main_menu
    puts 'Добро пожаловать в игру "Black Jack"'
    if @name.nil?
      puts 'Введите свое имя'
      @name = gets.chomp
      puts "Здравствуйте, #{@name}"
    else
      puts "Здравствуйте, #{@name}"
    end
    puts 'Выберите пункт меню:'
    puts '1. Начать игру'
    puts '0. Выход из игры'
    input = gets.chomp.to_i
    until input.nil?
      system('clear')
      if input == 1
        game
      elsif input == 0
        exit
      else
        main_menu
      end
    end
    puts 'Пока.'
    exit
  end

  def game
    start_game
  end

  def start_game
    start_game_player
    puts "Ваши карты: #{@cards_p}"
    puts "Ваш депозит: #{@deposit_p}"
    puts "#{@score}"
    puts
    start_game_dealer
    puts "Карты дилера: [****, ****]"
    puts "Депозит дилера: #{@deposit_p}"
  end

  def start_game_player
    @cards_p = "#{@cards_p}"
    @deposit_p = @deposit_p - 10
  end

  def start_game_dealer
    @cards_d = "#{@cards_d}"
    @deposit_d = @deposit_d - 10
  end

end
