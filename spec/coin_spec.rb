require_relative "../models/coin"

describe Coin do
  let(:coin) { Coin.new({weight: 5.67, diameter: 24.26, thickness: 1.75}) }

  describe "#weight" do
    it "returns a coin's weight in grams" do
      expect(coin.weight).to eq 5.67
    end
  end

  describe "#diameter" do
    it "returns a coin's diameter in millimeters" do
      expect(coin.diameter).to eq 24.26
    end
  end

  describe "#thickness" do
    it "returns a coin's thickness in millimeters" do
      expect(coin.thickness).to eq 1.75
    end
  end

  describe "#is_quarter" do
    it "identifies valid quarters" do
      expect(Coin.is_quarter(coin)).to be true
    end

    it "identifies non-quarters" do
      expect(Coin.is_quarter(Coin.new())).to be false
    end
  end
end
