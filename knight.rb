class Knight
  # Possible moves a knight can make
  MOVES = [
    [2, 1], [1, 2], [-1, 2], [-2, 1],
    [-2, -1], [-1, -2], [1, -2], [2, -1]
  ]

  def self.knight_moves(start, target)
    queue = [[start]]
    visited = Array.new(8) { Array.new(8, false) }
    visited[start[0]][start[1]] = true

    until queue.empty?
      path = queue.shift
      current = path.last

      return output_path(path) if current == target

      MOVES.each do |move|
        next_position = [current[0] + move[0], current[1] + move[1]]

        if valid_move?(next_position, visited)
          visited[next_position[0]][next_position[1]] = true
          queue << (path + [next_position])
        end
      end
    end
  end

  private

  def self.valid_move?(position, visited)
    x, y = position
    x.between?(0, 7) && y.between?(0, 7) && !visited[x][y]
  end

  def self.output_path(path)
    puts "You made it in #{path.size - 1} moves! Here's your path:"
    path.each { |move| p move }
    path
  end
end

# Example usage
Knight.knight_moves([0, 0], [7, 7])
