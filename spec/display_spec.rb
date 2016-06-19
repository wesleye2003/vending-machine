require_relative "../models/machine"

describe Display do
  let(:machine) { Machine.new()}
  let(:quarter) { Coin.new({weight: 5.67, diameter: 24.26, thickness: 1.75})}
  let(:dime) { Coin.new({weight: 2.27, diameter: 17.91, thickness: 1.35})}
  let(:nickel) { Coin.new({weight: 5, diameter: 21.21, thickness: 1.95})}
  let(:chips) { Product.new({name: "Chips", price: 50}) }

  describe "#show_inserted_value" do
    it "shows 'INSERT COIN' when no money is inserted" do
      machine.show_inserted_value
      expect(machine.display).to eq("INSERT COIN")
    end

    it "shows the proper monetary value when money is inserted" do
      machine.add_coin(nickel)
      machine.add_coin(dime)
      machine.add_coin(quarter)
      machine.show_inserted_value
      expect(machine.display).to eq(0.4)
    end
  end
end
