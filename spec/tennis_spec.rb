require 'tennis'

describe Tennis do
  let(:new_game) { Tennis.new }
  context "when a game begins" do
    it "returns love-love" do
      expect(new_game.current_score).to eq("love-love")
    end
  end

  context "when someone scores" do
    context "player 1 scores first" do
      it "return 15-love" do
        new_game.player_scores(1)
        expect(new_game.current_score).to eq("15-love")
      end
    end

    context "player 2 scores first" do
      it "return love-15" do
        new_game.player_scores(2)
        expect(new_game.current_score).to eq("love-15")
      end
    end
    context "both players score once" do
      it "returns 15-15" do
        new_game.player_scores(1)
        new_game.player_scores(2)
        expect(new_game.current_score).to eq("15-15")
      end
    end

    context "player 1 scores twice in a row" do
      it "returns 30-love" do
        2.times {new_game.player_scores(1)}
        expect(new_game.current_score).to eq("30-love")
      end
    end

    context "player 1 scores twice in a row" do
      it "returns 30-love" do
        2.times {new_game.player_scores(2)}
        expect(new_game.current_score).to eq("love-30")
      end
    end

    context "player 1 and player 2 score twice" do
      it "returns 30-30" do
        2.times do
          new_game.player_scores(1)
          new_game.player_scores(2)
        end
        expect(new_game.current_score).to eq("30-30")
      end
    end

    context "player 1 scores 3 times" do
      it "returns 40-love" do
        3.times { new_game.player_scores(1) }
        expect(new_game.current_score).to eq("40-love")
      end
    end

    context "player 2 scores 3 times" do
      it "returns 40-love" do
        3.times { new_game.player_scores(2) }
        expect(new_game.current_score).to eq("love-40")
      end
    end
  end

  context "Game is in Deuce" do
    context "both players scores 3 times" do
      it "goes into Deuce" do
        3.times do
          new_game.player_scores(1)
          new_game.player_scores(2)
        end
        expect(new_game.current_score).to eq("Deuce")
      end
    end

    context "player one scores whilst in Deuce" do
      it "Gives advantage to player 1" do
        3.times do
          new_game.player_scores(1)
          new_game.player_scores(2)
        end
        new_game.player_scores(1)
        expect(new_game.current_score).to eq("Advantage Player 1")
      end
    end

    context "player 2 scores whilst in deuce" do
      it "Gives advantage to player 2" do
        3.times do
          new_game.player_scores(1)
          new_game.player_scores(2)
        end
        new_game.player_scores(2)
        expect(new_game.current_score).to eq("Advantage Player 2")
      end
    end

    context "Player 2 scores whilst Player 1 has Advantage" do
      it "Returns to Deuce" do
        4.times do
          new_game.player_scores(1)
          new_game.player_scores(2)
        end
        expect(new_game.current_score).to eq("Deuce")
      end
    end
  end

  context "Game has been won" do
    context "Player 1 wins without advantage" do
      it "returns player 1 wins" do
        4.times { new_game.player_scores(1) }
        expect(new_game.current_score).to eq("Player 1 wins")
      end
    end

    context "Player 2 wins without advantage" do
      it "return Player 2 wins" do
        4.times { new_game.player_scores(2) }
        expect(new_game.current_score).to eq("Player 2 wins")
      end
    end

    context "Player 1 wins with advantage" do
      it "returns Player 1 wins" do
        3.times { new_game.player_scores(2) }
        5.times { new_game.player_scores(1) }
        expect(new_game.current_score).to eq("Player 1 wins")
      end
    end

    context "Player 2 wins with advantage" do
      it "returns Player 2 wins" do
        3.times { new_game.player_scores(1) }
        5.times { new_game.player_scores(2) }
        expect(new_game.current_score).to eq("Player 2 wins")
      end
    end
  end
end