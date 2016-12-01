class Game
  attr_reader :board, :current_player
  def initialize
    @board = Array.new(3) { Array.new(3) }
    @current_player = :x
  end

  def play(x,y)
    check_args(x,y)
    @board[x][y] ||= current_player
    change_turns
    board
  end

  def check_args(x,y)
    [x,y].each{ |coord| raise ArgumentError, 'coordinates must be in the range 0..1' unless (0..2).include?(coord) } 
  end

  def change_turns
    @current_player = [:o,:x][[:x, :o].index(@current_player)]
  end
end