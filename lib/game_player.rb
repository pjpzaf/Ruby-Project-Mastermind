# Class for human player in mastermind game
class GamePlayer
  attr_reader :name
  attr_accessor :score

  def initialize(name, score)
    @name = name
    @score = score
  end
end