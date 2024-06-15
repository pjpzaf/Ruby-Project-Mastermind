require_relative 'lib/game_player'
require_relative 'lib/game_functions'

# Game starts
puts 'Mastermind: Man vs. Machine'
puts "\n"
print 'Please enter your name: '
player_name = gets
puts "\n"
player = GamePlayer.new(player_name, 0)
puts "\n"
puts "Welcome #{player.name}"
puts "\n"
print 'How many game rounds (maximum of 5): '
game_rounds = gets
game_rounds = game_rounds.to_i
new_game = GameFunctions.new(game_rounds)
puts "\n"

# To check if the correct number of rounds are selected by the player
loop_counter = 0
until loop_counter == 1
  if (game_rounds.is_a? Integer) != true
    game_rounds = new_game.invalid_round(game_rounds)
  elsif game_rounds <= 0
    game_rounds = new_game.invalid_round(game_rounds)
  elsif game_rounds > 5
    game_rounds = new_game.invalid_round(game_rounds)
  else
    loop_counter = 1
  end
end

puts 'The game roles will change at every turn, meaning if the human player'
puts 'is the codebreaker now and the computer is the codemaker, then'
puts 'in the next round, their roles will be swapped!'

puts 'Please choose a role'
puts "type '1' in the terminal for codebreaker"
puts "type '2' in the terminal for codemaker"
print 'Please select 1 or 2:'

role_select = gets
role_select = role_select.gsub(/\s+/, '')
loop_counter = 0
until loop_counter == 1
  if role_select != '1' && role_select != '2'
    puts 'invalid input'
    puts "type '1' in the terminal for codebreaker"
    puts "type '2' in the terminal for codemaker"
    print 'Please select 1 or 2:'
    role_select = gets
    role_select = role_select.gsub(/\s+/, '')
  elsif role_select == '1'
    loop_counter = 1
  elsif role_select == '2'
    loop_counter = 1
  end
end

for round_counter in 1..game_rounds
  puts "Round #{round_counter}"
  # The player is the codebreaker
  if role_select == '1'
    puts "#{player.name.chop} is the codebreaker!"
    computer_code = new_game.generate_code
    puts computer_code
    puts 'The computer has created the code!'
    for game_counter in 0..11
      puts "Guess number #{game_counter + 1}"
      player_choice = new_game.player_input
      player_choice = new_game.check_input(player_choice)
      correct_guess = new_game.evaluate_input(computer_code, player_choice)
      puts correct_guess
    end

  # The player is the codemaker
  elsif role_select == '2'
    puts "#{player.name.chop} is the codemaker!"
  end
end
