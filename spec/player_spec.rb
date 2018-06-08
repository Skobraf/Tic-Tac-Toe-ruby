
require "Player"


describe Player do
  before do
    @player = Player.new("...", ".")
  end

  describe ".clear" do
    context "empty player inputs" do
      it "returns empty array" do
        expect(@player.clear).to eql([])
      end
    end

    before do
      @player.inputs = [1,2,3,4,5]
    end

    context "empty full player inputs" do
      it "return empty array" do
        expect(@player.clear).to eql([])
      end
    end

    context "no given player name" do
      it "raises an MissingSign" do
        expect{Player.new("","X")}.to raise_error(MissingName)
      end
    end

    context "no given player sign" do
      it "raises a MissingSign" do
        expect{Player.new("Ayoub","")}.to raise_error(MissingSign)
      end
    end
  end
end
