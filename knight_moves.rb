class Board
  
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

  def initialize
      
  # SO, if we have an 8 by 8 board there should be 64 combinations of coordinates.

  end

end