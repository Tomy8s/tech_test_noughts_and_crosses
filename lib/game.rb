class Game
  attr_reader :board
  def initialize
    @board = Array.new(3, Array.new(3))
  end

  def check_args(x,y)
    [x,y].each{ |coord| raise ArgumentError, 'coordinates must be in the range 0..1' unless (0..2).include?(coord) } 
  end

  def play(x,y)
    
  end
end