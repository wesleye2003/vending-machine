require_relative "../models/coin"
require_relative "../models/machine"
require_relative "../models/coin_sorter"

describe CoinSorter do
  let(:machine) { Machine.new()}
  let(:quarter) { Coin.new({weight: 5.67, diameter: 24.26, thickness: 1.75})}
  let(:dime) { Coin.new({weight: 2.27, diameter: 17.91, thickness: 1.35})}
  let(:nickel) { Coin.new({weight: 5, diameter: 21.21, thickness: 1.95})}
  let(:penny) { Coin.new() }

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

  describe "#add_coin" do
    it "stores the coin in the machine" do
      machine.add_coin(quarter)
      expect(machine.coins[25]).to eq 1
    end

    it "adds the coin's value to the inserted value" do
      machine.add_coin(dime)
      expect(machine.inserted_value).to eq 10
    end

    it "does not add invalid coins" do
      expect(machine.add_coin(penny)).to be false
    end
  end
end
