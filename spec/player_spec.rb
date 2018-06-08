
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
  end
end
