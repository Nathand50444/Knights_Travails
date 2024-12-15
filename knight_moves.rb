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

    # When the loop is broken the path is constructed from @start_position to @target_position
    path = []
    current_position = @target_position
    
    # Using a 'while' loop we can add the 'current_position' and iterate through all the hashes to piece together to path.
    while current_position != @start_position
      path.unshift(current_position) 
      current_position = previous_position[current_position]
    end
    
    # The 'while' loop breaks and the @start_position is added to the path
    path.unshift(@start_position)

    # The final lines output the path that has been constructed
    puts "You made it in #{path.length - 1} moves! Here's your path:"
    path.each { |step| puts step.inspect }
    path

  end

  def valid_input?(row, col)
    row.is_a?(Integer) && col.is_a?(Integer) && row.between?(1, 8) && col.between?(1, 8)
  end  

end