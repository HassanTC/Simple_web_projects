require "spec_helper"
module TicTacToe
  describe Game do
    let(:hassan)  {Player.new({color: "X" , name: "hassan"})}
    let(:rubyist) {Player.new({color: "O", name: "Rubyist"})}

    context "#initialize" do
      it "randomly select current player" do
        Array.any_instance.stub(:shuffle) { [rubyist, hassan] }
        game = Game.new([hassan, rubyist])
        expect(game.current_player).to eq rubyist
      end
      it "randomly selects an other player" do
        Array.any_instance.stub(:shuffle) { [rubyist, hassan] }
        game = Game.new([hassan, rubyist])
        expect(game.other_player).to eq hassan
      end
    end
      context "#switch_players" do
        it "will set @current_player to @other_player" do
          game = Game.new([hassan, rubyist])
          other_player = game.other_player
          game.switch_players
          expect(game.current_player).to eq other_player
        end

        it "will set @other_player to @current_player" do
          game = Game.new([hassan, rubyist])
          current_player = game.current_player
          game.switch_players
          expect(game.other_player).to eq current_player
        end
      end
      context "#solicit_move" do
        it "asks the player to make a move" do
          game = Game.new([hassan, rubyist])
          game.stub(:current_player) { hassan }
          expected = "hassan: Enter a number between 1 and 9 to make your move"
          expect(game.solicit_move).to eq expected
        end
      end
      context "#get_move" do
        it "converts human_move of '1' to [0, 0]" do
          game = Game.new([hassan, rubyist])
          expect(game.get_move).to eq [0, 0]
        end

        it "converts human_move of '7' to [2, 0]" do
          game = Game.new([hassan, rubyist])
          expect(game.get_move).to eq [2, 0]
        end
      end
      context "#game_over_message" do
        it "returns '{current player name} won!' if board shows a winner" do
          game = Game.new([hassan, rubyist])
          game.stub(:current_player) { hassan }
          game.board.stub(:game_over) { :winner }
          expect(game.game_over_message).to eq "hassan won!"
        end

        it "returns 'The game ended in a tie' if board shows a draw" do
          game = Game.new([hassan, rubyist])
          game.stub(:current_player) { hassan }
          game.board.stub(:game_over) { :draw }
          expect(game.game_over_message).to eq "The game ended in a tie"
        end
      end
  end
end
