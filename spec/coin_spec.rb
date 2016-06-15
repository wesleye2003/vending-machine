require_relative "../models/coin"

describe Coin do
  let(:quarter) { Coin.new({weight: 5.67, diameter: 24.26, thickness: 1.75})}
  let(:dime) { Coin.new({weight: 2.27, diameter: 17.91, thickness: 1.35})}
  let(:nickel) { Coin.new({weight: 5, diameter: 21.21, thickness: 1.95})}

  describe "#weight" do
    it "returns a coin's weight in grams" do
      expect(quarter.weight).to eq 5.67
    end
  end

  describe "#diameter" do
    it "returns a coin's diameter in millimeters" do
      expect(quarter.diameter).to eq 24.26
    end
  end

  describe "#thickness" do
    it "returns a coin's thickness in millimeters" do
      expect(quarter.thickness).to eq 1.75
    end
  end

  describe "#is_quarter" do
    it "identifies valid quarters" do
      expect(Coin.is_quarter(quarter)).to be true
    end

    it "identifies non-quarters" do
      expect(Coin.is_quarter(nickel)).to be false
    end

    it "does identifies non-coins" do
      expect(Coin.is_quarter("rock")).to be false
    end
  end

  describe "#is_dime" do
    it "identifies valid dimes" do
      expect(Coin.is_dime(dime)).to be true
    end

    it "identifies non-dimes" do
      expect(Coin.is_dime(quarter)).to be false
    end

    it "does identifies non-coins" do
      expect(Coin.is_dime("rock")).to be false
    end
  end

  describe "#is_nickel" do
    it "identifies valid nickels" do
      expect(Coin.is_nickel(nickel)).to be true
    end

    it "identifies non-nickels" do
      expect(Coin.is_nickel(dime)).to be false
    end

    it "does identifies non-coins" do
      expect(Coin.is_nickel("rock")).to be false
    end
  end
end
