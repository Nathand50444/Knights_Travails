class Board
  
  def initialize
    @moves = [
      [2, 1], [2, -1], [-2, 1], [-2, -1],
      [1, 2], [1, -2], [-1, 2], [-1, -2]
    ]
    @board_size = 8 # Chessboard is 8x8
  end

  def valid_move?(x, y)
    x.between?(0, @board_size - 1) && y.between?(0, @board_size - 1)
  end

  def find_shortest_path(start, end)
  end

end