require_relative "../models/coin"
# Coin
describe Coin do
  let(:coin) { Coin.new(5.67, 24.26, 1.75) }

  describe "#initialize" do
    it "takes two arguments" do
      expect(Coin.instance_method(:initialize).arity).to eq 3
    end
  end

  describe "#weight" do
    xit "returns a coin's weight in grams" do
      expect(coin.weight).to eq 5.67
    end
  end

  describe "#diameter" do
    xit "returns a coin's diameter in millimeters" do
    end
  end

  describe "#thickness" do
    xit "returns a coin's thickness in millimeters" do
    end
  end
end


## Know their weight

## Know their size
