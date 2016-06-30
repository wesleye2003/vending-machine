require_relative "../models/coin"
require_relative "../models/coin_sorter"

describe CoinSorter do
  let(:quarter) { Coin.new({weight: 5.67, diameter: 24.26, thickness: 1.75})}
  let(:dime) { Coin.new({weight: 2.27, diameter: 17.91, thickness: 1.35})}
  let(:nickel) { Coin.new({weight: 5, diameter: 21.21, thickness: 1.95})}

  describe "#valid_type" do
    it "identifies valid quarters" do
      expect(CoinSorter.valid_type(quarter)).to eq 25
    end

    it "identifies valid dimes" do
      expect(CoinSorter.valid_type(dime)).to eq 10
    end

    it "identifies valid nickels" do
      expect(CoinSorter.valid_type(nickel)).to eq 5
    end

    it "identifies non-coins" do
      expect(CoinSorter.valid_type("rock")).to be nil
    end
  end
end
