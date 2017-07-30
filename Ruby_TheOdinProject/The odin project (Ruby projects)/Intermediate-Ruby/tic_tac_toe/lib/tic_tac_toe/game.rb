module TicTacToe
  class Game
    attr_accessor :players, :board, :current_player, :other_player
    def initialize(players, board = Board.new)
      @players        = players
      @board          = board
      @current_player, @other_player = players.shuffle
    end
    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end
    def get_move
      current_player.class.to_s == "TicTacToe::ComputerPlayer" ? human_move_to_coordinate(current_player.play(board)) : human_move_to_coordinate(human_move = gets.chomp)
    end
    def solicit_move
      "#{current_player.name}: Enter a number between 1 and 9 to make your move"
    end
    def game_over_message
      return "#{current_player.name} won!" if board.game_over == :winner
      return "The game ended in a tie"     if board.game_over == :draw
    end
    def play
      puts "#{current_player.name} has randomly been selected as the first player"
      while true
        board.formatted_grid
        puts ""
        puts solicit_move
        x, y = get_move
        board.set_cell(x, y, current_player.color)
        if board.game_over
          puts game_over_message
          board.formatted_grid
          return
        else
          switch_players
        end
      end
    end
    private

    def human_move_to_coordinate(human_move)
      mapping = {
        "1" =>[0, 0],
        "2" =>[0, 1],
        "3" =>[0, 2],
        "4" =>[1, 0],
        "5" =>[1, 1],
        "6" =>[1, 2],
        "7" =>[2, 0],
        "8" =>[2, 1],
        "9" =>[2, 2]
      }
      mapping[human_move]
    end
  end
end