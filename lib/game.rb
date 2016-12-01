class Game
  attr_accessor :board, :current_player
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
    board
  end

  def result
    three_in_a_row? or
    three_in_a_column? or
    "not finished"

  end

  def three_in_a_row?
    board.each do |row|
      if !row[0].nil? && !row.include?(!row[0])
        return "#{row[0].capitalize} wins with three in a row!"
      end
    end
    false
  end

  def three_in_a_column?
    (0..2).each do |col|
      if !board[0][col].nil?
        column = [board[0][col], board[1][col], board[2][col]]
        if !column.include?(!column[0])
          return "#{column[0].capitalize} wins with three in a column!"
        end
      end
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