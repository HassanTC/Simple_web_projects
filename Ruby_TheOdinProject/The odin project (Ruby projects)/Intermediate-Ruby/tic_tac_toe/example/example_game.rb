require_relative "../lib/tic_tac_toe.rb"

puts "Welcome to tic tac toe"
hassan = TicTacToe::Player.new({color: "X", name: "hassan"})
rubyist = TicTacToe::ComputerPlayer.new({color: "O", name: "Rubyist"})
players = [hassan, rubyist]
TicTacToe::Game.new(players).play
