
require 'Board'
require 'Player'

describe Board do

  before do
    @player = Player.new("Ron","X")
    @board = Board.new
  end


  describe ".update" do
    context "updates the board" do
      it "pushes sign to position" do
        expect(@board.update(1, @player)).to eql(["X", nil, nil, nil, nil, nil, nil, nil, nil])
        expect(@board.update(5, @player)).to eql(["X", nil, nil, nil, "X", nil, nil, nil, nil])
        expect(@board.update(3, @player)).to eql(["X", nil, "X", nil, "X", nil, nil, nil, nil])
      end
    end
  end

  describe ".clear" do
    context "clearing the board" do
      it "it clears board array" do
        expect(@board.clear.board).to eql([nil, nil, nil, nil, nil, nil, nil, nil, nil])
      end
    end
  end

  describe ".full?" do
    before do
      @board = Board.new
      @player = Player.new("Ron", "X")
      i = 0
      9.times do
        i += 1
        @board.update(i, @player)
      end
    end

    context "checks if board array is full" do
      it "returns true when board is full" do
        expect(@board.full?).to eql(true)
      end
    end

    # WIP
    # before do
    #   @board = Board.new
    # end

    # context "prints the board correctly" do
    #   it "prints empty board" do
    #     expect{@board.show}.to output("    |   |  "+ "\n-------------\n" + "    |   |  " + "\n-------------\n" + "    |   |  " ).to_stdout
    #   end
    # end
  end
end
