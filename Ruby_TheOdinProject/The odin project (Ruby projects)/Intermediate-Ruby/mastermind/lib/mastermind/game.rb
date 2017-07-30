module Mastermind
  class Game
    require 'colorize'
    attr_accessor :board, :current_turn
    def initialize(board = Board.new)
      @board = board
      @current_turn = []
    end

    def first_screen
      puts "Welcome To Mindmaster Game".center(75)
      puts "the list of colors we provide".center(75)
      puts prepare_colors
    end
    def play
      first_screen
      10.times do
        4.times do
          puts "Enter a guess"
          color = gets.chomp
          @current_turn << color.to_sym
        end
        if finish?
          puts feedback
          puts "Now we have a winner! Congrats :D"
          return
        else
          puts feedback
        end
      end
    end

    def feedback
      result = []
      for i in 0...board.board.size
        board.board[i] == current_turn[i] ? result.push("GUESS".colorize(:blue)) : result.push("GUESS".colorize(:red))
      end
      result.join(" ")
    end

    private
    def prepare_colors
      human_colors = []
      board.colors.each do |color|
        human_colors << color.to_s.colorize(color)
      end
      human_colors.join(" ")
    end
    def finish?
      winner? ? true : false
    end
    def winner?
      board.board == current_turn
    end
  end
end
