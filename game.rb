require_relative './test.rb'
class Game
  include Test
  attr_accessor :cards_p, :cards_d, :deposit_p, :deposit_d
  attr_reader :name, :deck, :card

  def initialize
    @cards_p = []
    @cards_d = []
    @deposit_p = []
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
    start_game_dealer
    puts "Карты дилера: [****, ****]"
  end

  def start_game_player
    @cards_p = "#{@cards_p}"
    puts "#{deposit_p}".to_i
    puts @deposit_p =- 20
  end

  def start_game_dealer
    @cards_d = "#{@cards_d}"
    puts @deposit_d =- 10
  end

end
