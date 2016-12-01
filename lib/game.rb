require 'matrix'

class Game
  attr_reader :board, :current_player
  def initialize
    @board = Array.new(3) { Array.new(3) }
    @current_player = :x
  end

  def play(x,y)
    check_args(x,y)
    if @board[x][y].nil?
      @board[x][y] = current_player
      change_turns
    else
      raise ArgumentError, 'cell already taken'
    end
    print_grid
    result
  end

  def print_grid
    print board[2]
    puts ''
    print board[1]
    puts ''
    print board[0]
    puts ''
  end

  def result
    three_in_a_row? or
    three_in_a_column? or
    three_diagonally? or
    draw? or
    "not finished"
  end

  private

  def three_in_a_row?
    board.each do |row|
      if !row[0].nil? && row.uniq.size == 1
        return "#{row[0].capitalize} wins with three in a row!"
      end
    end
    false
  end

  def three_in_a_column?
    @matrix = Matrix[board[0], board[1], board[2]]
    (0..2).each do |col|
      column = @matrix.column(col).to_a
      if !column[0].nil? && column.uniq.size == 1
        return "#{column[0].capitalize} wins with three in a column!"
      end
    end
    false
  end

  def three_diagonally?
    if !board[1][1].nil?
      diagonal1 = []
      (0..2).each do |i|
        diagonal1 << board[i][i]
      end
      diagonal2 = [board[0][2], board[1][1], board[2][0]]
      if diagonal1.uniq.size == 1 || diagonal2.uniq.size == 1
        return "#{board[1][1].capitalize} wins with three diagonaly!"
      end
    end
    false
  end

  def draw?
    if !board.flatten.include?(nil)
      return "It's a draw"
    end
    false
  end

  def check_args(x,y)
    [x,y].each{ |coord| raise ArgumentError, 'coordinates must be in the range 0..1' unless (0..2).include?(coord) } 
  end

  def change_turns
    @current_player = [:o,:x][[:x, :o].index(@current_player)]
  end
end