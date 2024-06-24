# Class for the methods/functions used in Main.rb
class GameFunctions
  attr_accessor :game_rounds, :computer_score
  attr_reader :color_pegs

  def initialize(game_rounds, computer_score)
    @game_rounds = game_rounds
    @color_pegs = %w[r g b y w p]
    @computer_score = computer_score
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
        loop_counter = 0
        player_choice = invalid_input
      elsif player_choice.length == 4
        player_choice.each do |choice|
          if color_pegs.include?(choice)
            loop_counter += 1
          else
            loop_counter = 0
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
      elsif element != guess[loop_counter]
        loop_counter += 1
      end
    end
    correct_guess
  end

  def display_result(correct_guess)
    puts "You guessed #{correct_guess} out of 4"
  end

  def cb_round_result(correct_guess, player)
    if correct_guess == 4
      player_win(player)
    elsif correct_guess != 4
      computer_wins(computer_score)
    end
  end

  def display_score(player, computer_score)
    puts 'The score is'
    puts "#{player.name.chop}: #{player.score}"
    puts "Computer: #{computer_score}"
  end

  def player_win(player)
    puts "#{player.name.chop} wins this round!"
    player.score += 1
  end

  def computer_wins(computer_score)
    puts 'The computer wins this round!'
    computer_score += 1
  end
end
