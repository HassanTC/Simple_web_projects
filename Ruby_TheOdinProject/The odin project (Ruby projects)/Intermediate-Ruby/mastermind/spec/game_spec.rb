require "spec_helper"
module Mastermind
  describe Game do
    context "#initialize" do
      it "should create a game even if no argument" do
        expect { Game.new}.not_to raise_error
      end
      it "should accept the board type you enter" do
        expect {Game.new(Board.new(6))}.not_to raise_error
      end
    end
    
  end
end
