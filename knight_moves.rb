
  # For this project, you’ll need to use a data structure that’s similar (but not identical) to a binary tree - graphs.
  # For a good introduction on what graphs are, reference Khan Academy’s “Describing Graphs” (link below).
  # https://www.khanacademy.org/computing/computer-science/algorithms/graph-representation/a/describing-graphs
  

  # Each square on the board is a node (or vertex). A knight’s valid moves from any square represent the edges (or connections)
  # between the vertices. Thus, the problem of finding the shortest path for the knight’s movement becomes a graph traversal problem. 
  # The goal is to traverse the graph (the chessboard) to find the shortest route between two nodes (the start and end positions).
  

  # Your task is to build a function knight_moves that shows the shortest possible way to get from one square to another by 
  # outputting all squares the knight will stop on along the way.

  # You can think of the board as having 2-dimensional coordinates. Your function would therefore look like:

  # knight_moves([0,0],[1,2]) == [[0,0],[1,2]]
  
  # ---
  
  # Think about the rules of the board and knight, make sure to follow them.
  
  # For every square there is a number of possible moves, choose a data structure that will allow you to work with them. Don’t allow any moves to go off the board.
  # Decide which search algorithm is best to use for this case. Hint: one of them could be a potentially infinite series.
  # Use the chosen search algorithm to find the shortest path between the starting square (or node) and the ending square. Output what that full path looks like, e.g.:
  #   > knight_moves([3,3],[4,3])
  #   => You made it in 3 moves!  Here's your path:
  #     [3,3]
  #     [4,5]
  #     [2,4]
  #     [4,3]

# ---------------------------------------------------------------------------------------

# Breadth-first-search

# Pass the target coordinate into the function i.e. function(x, y) /

# Establish acceptable moves from the knight by x and y values. Constant of 8 different steps /

# Keep track of number of moves made 
# Keep track of (current position)

# Use a map to track visited/not visited squares

# Use a queue of the visited nodes

# Let the head be the top of the queue and remove it from the queue

# IF the head is the target coordinates then return the step

# IF NOT, then process the next round which is the total of the head coords plus direction coords (a+b, c+d)

# If a coord has already been visited then skip that coord

# Add 1 to the number of steps 

class KnightMoves
  
  def initialize(x_target, y_target, x_start, y_start)
      @start_position = [x_start, y_start]
      @target_position = [x_target, y_target]
  end

  ACCEPTABLE_MOVES = [[2,1], [2,-1], [-2,1], [-2,-1], [1,2], [-1,2], [1,-2], [-1,-2]]

  def move_to_target
    visited_positions = []
    previous_position = {}
    potential_moves = []
    queue = []

    ACCEPTABLE_MOVES.each do |x, y| 
      if valid_input?(@start_position[0] + x , @start_position[1] + y)
        potential_moves.push([@start_position[0] + x , @start_position[1] + y])
      end
    end

    visited_positions.push(potential_moves)
    queue.push(potential_moves)
    potential_moves.each do [move] 
      previous_position.push(@start_position => move)
    end
  end

  def valid_input?(row, col)
    row.is_a?(Integer) && col.is_a?(Integer) && row.between?(1, 8) && col.between?(1, 8)
  end  

end