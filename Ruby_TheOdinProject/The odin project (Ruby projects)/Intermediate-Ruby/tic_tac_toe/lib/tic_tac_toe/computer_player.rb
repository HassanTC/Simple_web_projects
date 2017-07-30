module TicTacToe
  class ComputerPlayer < Player

    def play board
      grid = board.grid.flatten
      (1..grid.size).each { |i| return i.to_s  if grid[i-1].value == "" }
    end

  end
end
