require_relative 'lib/game_player'
require_relative 'lib/game_round'

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
puts "\n"
loop_counter = 0
until loop_counter == 1
  if (game_rounds.is_a? Integer) != true
    print 'Invalid input! Please input a number from 1-5: '
    game_rounds = gets
    game_rounds = game_rounds.to_i
    puts "\n"
  elsif game_rounds <= 0
    print 'Invalid input! Please input a number from 1-5: '
    game_rounds = gets
    game_rounds = game_rounds.to_i
    puts "\n"
  elsif game_rounds > 5
    print 'Too many rounds! Please input a number from 1-5: '
    game_rounds = gets
    game_rounds = game_rounds.to_i
    puts "\n"
  else
    loop_counter = 1
  end
end
