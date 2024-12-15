
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
    # Establish variables for 'visited_positions', 'previous_position' and the BFS queue
    visited_positions = []
    previous_position = {}
    queue = []
    
    # We add the starting position to the BFS queue and to the 'visited_positions'
    queue.push(@start_position)
    visited_positions.push(@start_position)

    # This 'until' loop controls the main logic of the search
    # The search is broken if the queue is empty or if we arrive in the target position
    until queue.empty?
      current_position = queue.shift
      
      if current_position == @target_position
        break
      end
  
    # The valid moves are established using the constant moves in relation to the current_position
      ACCEPTABLE_MOVES.each do |x, y|
        next_position = [current_position[0] + x, current_position[1] + y]

        # The iterated move is checked to be within the board and checked whether it has already been visited.
        if valid_input?(next_position[0], next_position[1]) && !visited_positions.include?(next_position)
          # if the above are both true then we can add it to the queue, 'visited_positions' and the path is tracked in 'previous_position'
          queue.push(next_position) 
          visited_positions.push(next_position) 
          previous_position[next_position] = current_position 
        end
      end
    end
  end

  def valid_input?(row, col)
    row.is_a?(Integer) && col.is_a?(Integer) && row.between?(1, 8) && col.between?(1, 8)
  end  

end