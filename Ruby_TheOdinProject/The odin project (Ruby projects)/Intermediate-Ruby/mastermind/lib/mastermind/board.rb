module Mastermind
  require 'colorize'
  class Board
    attr_reader :board, :colors
    def initialize(board_length = 4)
      @board_length = board_length
      @board = generate_board
      @colors = all_colors
    end
    private
    def generate_board
      String.colors.sample(@board_length)
    end
    def all_colors
      String.colors
    end
  end
end
