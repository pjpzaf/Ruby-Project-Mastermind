# Class for the methods/functions used in Main.rb
class GameFunctions
  attr_accessor :game_rounds
  attr_reader :color_pegs

  def initialize(game_rounds)
    @game_rounds = game_rounds
    @color_pegs = %w[r g b y w p]
  end

  # A single 12 round game wherein the player is the codebreaker
  # and the computer is the codemaker.
  # Colors that can be selected as pegs are red, green, blue, yellow, white
  # and pink
  def player_codebreaker
    puts "Round #{round}"
    puts "\n"
    computer_code = generate_code
  end

  def generate_code
    computer_code = []
    for array_index in 0..3
      computer_code[array_index] = color_pegs[rand(5)]
    end
    computer_code
  end

  def player_input
    puts 'Please enter your selected color pegs in their appropriate position'
    puts 'i.e. pgby = pink-1, green-2, blue-3, yellow-3: '
    player_choice = gets
    player_choice = player_choice.gsub(/\s+/, '')
    player_choice.chars
  end

  def check_input(player_choice)
    loop_counter = 0
    until loop_counter == 4
      if player_choice.length != 4
        player_choice = invalid_input
      elsif player_choice.length == 4
        player_choice.each do |choice|
          if color_pegs.include?(choice)
            loop_counter += 1
          else
            player_choice = invalid_input
          end
        end
      end
    end
    player_choice
  end

  def invalid_input
    puts 'Invalid inputs!'
    puts 'your choices are r = red, g = green, b = blue, y = yellow'
    puts 'w = white, p = pink. Also, please limit only to four characters at a'
    puts 'time'
    player_input
  end

  def invalid_round(game_rounds)
    print 'Invalid input! Please input a number from 1-5: '
    game_rounds = gets
    game_rounds.to_i
  end

  def evaluate_input(code, guess)
    correct_guess = 0
    loop_counter = 0
    code.each do |element|
      if element == guess[loop_counter]
        correct_guess += 1
        loop_counter += 1
      end
    end
    correct_guess
  end
end
