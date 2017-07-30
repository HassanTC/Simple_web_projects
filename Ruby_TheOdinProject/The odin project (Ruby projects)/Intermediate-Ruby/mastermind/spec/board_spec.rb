require "spec_helper"
module Mastermind
  describe Board do
    context "#initialize" do

       it "Should not raise an error if no argument" do
         expect { Board.new}.not_to raise_error
       end

       it "should Create a board of length 4 when no argument" do
         board = Board.new
         expect(board.board.length).to eq(4)
       end

       it "should create a board with symbols elements" do
         board = Board.new
         board.board.each do |e|
           expect(e.class).to eq(Symbol)
         end
       end

       it "s length must be equal to intialized length" do
         board = Board.new(6)
         expect(board.board.length).to eql 6
       end

       it "return a colors array once created" do
         board = Board.new
         expect(board.colors.class).to eq Array
       end
    end
  end
end
