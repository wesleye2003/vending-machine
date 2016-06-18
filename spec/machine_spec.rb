# Machine
require_relative "../models/machine"

describe Machine do
  let(:machine) { Machine.new()}
  let(:quarter) { Coin.new({weight: 5.67, diameter: 24.26, thickness: 1.75})}
  let(:dime) { Coin.new({weight: 2.27, diameter: 17.91, thickness: 1.35})}
  let(:nickel) { Coin.new({weight: 5, diameter: 21.21, thickness: 1.95})}
  let(:penny) { Coin.new() }
  let(:chips) { Product.new({name: "Chips", price: 0.5}) }

  describe "#initialize" do
    it "initializes with no money inserted" do
      expect(machine.inserted_value).to eq 0
    end

    it "initializes with no stored coins" do
      expect(machine.coins).to eq({'quarter' => 0, 'dime' => 0, 'nickel' => 0})
    end
  end

  describe "#add_coin" do
    it "stores the coin in the machine" do
      machine.add_coin(quarter)
      expect(machine.coins['quarter']).to eq 1
    end

    it "adds the coin's value to the inserted value" do
      machine.add_coin(dime)
      expect(machine.inserted_value).to eq 0.1
    end

    it "does not add invalid coins" do
      expect(machine.add_coin(penny)).to be false
    end
  end

  describe "#products" do
    it "starts as an empty array" do
      expect(machine.products).to eq([])
    end

    describe "#add_product" do
      it "adds a product object to a machine's inventory" do
        machine.add_product(chips)
        expect(machine.products).to eq([chips])
      end

      it "does not add non-product objects to a machine's inventory" do
        machine.add_product("chips")
        expect(machine.products).to eq([])
      end
    end

    describe "#remove_product" do
      before(:each) do
        machine.add_product(chips)
      end

      it "removes a product object from a machine's inventory" do
        machine.remove_product(chips)
        expect(machine.products).to eq([])
      end

      it "only removes one product from the machine when duplicates are present" do
        machine.add_product(chips)
        machine.remove_product(chips)
        expect(machine.products).to eq([chips])
      end
    end
  end

  describe "#in_stock?" do
    it "determines whether or not a product is present in machine's inventory" do
      machine.add_product(chips)
      expect(machine.in_stock?(chips)).to be true
    end
  end

  describe "#try_to_sell" do
    context "when the selected product is in stock" do
      context "and enough money for the product is inserted" do
        before(:each) do
          5.times do
            machine.add_product(chips)
          end
          3.times do
            machine.add_coin(quarter)
          end
          machine.try_to_sell(chips)
        end

        it "sells the selected product" do
          expect(machine.products).to eq([chips, chips, chips, chips])
        end

        it "adjusts inserted value when a product is sold" do
          expect(machine.inserted_value).to eq(0.25)
        end

        context "and more than enough money was inserted" do
          xit "gives back change" do
            expect(machine.coins).to eq({'quarter' => 1, 'dime' => 0, 'nickel' => 0})
          end
        end
      end

      context "and less than enough money is inserted" do
        before(:each) do
          machine.add_product(chips)
          machine.add_coin(quarter)
          machine.try_to_sell(chips)
        end

        xit "does not sell the product" do
          expect(machine.products).to eq([chips])
        end

        xit "does not change the amount of money inserted" do
          expect(machine.inserted_value).to eq 0.25
        end
      end
    end

    context "when the product is out of stock" do
      it "does not change the amount of money inserted" do
        3.times do
          machine.add_coin(quarter)
        end
        machine.try_to_sell(chips)
        expect(machine.coins).to eq({'quarter' => 3, 'dime' => 0, 'nickel' => 0})
      end
    end

  end

  xdescribe "#return_inserted_value" do
    context "if there is an inserted value" do
      before(:each) do
        machine.add_coin(quarter)
        machine.add_coin(dime)
        machine.add_coin(nickel)
      end

      it "removes coins whose value are equal to the inserted value" do
        machine.return_inserted_value
        expect(machine.coins).to eq({'quarter' => 1, 'dime' => 1, 'nickel' => 1})
      end

      it "sets the total inserted value back to zero" do
        expect(machine.inserted_value).to eq 0.4
      end
    end

    context "if there is no inserted value" do
      it "does nothing" do
        expect(machine.return_inserted_value).to be false
      end
    end
  end

#### WHEN TOTAL INSERTED VALUE IS LESS THAN SELECTED PRODUCT'S VALUE AND PRODUCT IS IN STOCK

##### Product quantity does not change

##### Total inserted value does not change



## Refunds coins

### WHEN TOTAL INSERTED VALUE IS GREATER THAN 0 AND RETURN COINS IS PRESSED

#### Total inserted value is returned to the customer

#### Total inserted value is reset


### WHEN TOTAL INSERTED VALUE IS 0 AND RETURN COINS IS PRESSED

#### Nothing is returned to the customer

#### Total inserted value does not change
end
