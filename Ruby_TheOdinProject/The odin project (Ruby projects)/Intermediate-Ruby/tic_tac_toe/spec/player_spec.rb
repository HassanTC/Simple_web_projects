require "spec_helper"
module TicTacToe
  describe Player do
    context "#initialize" do
      it "Raise an exception when initialize with {}" do
        expect { Player.new({})}.to raise_error(KeyError)
      end
      it "Does not raise an exception when run a valid hash" do
        expect{Player.new({color: "X" , name: "Hassan"})}.not_to raise_error
      end
    end
    context "#color" do
      it "Returns the right color" do
        player = Player.new({color: "X" , name: "Hassan"})
        expect(player.color).to eq("X")
      end
      it "Returns the right name" do
        player = Player.new({color: "O" , name: "Rubyist"})
        expect(player.name).to eq("Rubyist") 
      end
    end
  end
end
