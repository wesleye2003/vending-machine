# Machine
require_relative "../models/machine"


describe Machine do
  let(:machine) { Machine.new()}
  let(:quarter) { Coin.new({weight: 5.67, diameter: 24.26, thickness: 1.75})}
  let(:dime) { Coin.new({weight: 5.67, diameter: 24.26, thickness: 1.75})}
  let(:nickel) { Coin.new({weight: 5, diameter: 21.21, thickness: 1.95})}
  let(:penny) { Coin.new() }

  describe "#initialize" do
    it "initializes with no money inserted" do
      expect(machine.inserted_value).to eq 0
    end
  end



  describe "#coin_is_valid" do
    xit "takes a valid coin object" do
      expect(machine.coin_is_valid(quarter)).to be true
    end

    xit "does not take invalid coins" do
      expect(machine.coin_is_valid(penny)).to be false
    end

    xit "does not take non-coins" do
      expect(machine.coin_is_valid("rock")).to be false
    end

  end
## Accepts valid coins

### WHEN INSERTED COIN IS VALID

#### Assigns value to inserted coin

#### Stores inserted coin

#### Updates total inserted value


## Rejects invalid coins

### WHEN INSERTED COIN IS INVALID

#### Does not store inserted coin

#### Does not change total inserted value


## Has inventory quantities of individual products

### Quantities can be increased

### Quantities can be decreased

### Products can be selected for sale

#### WHEN TOTAL INSERTED VALUE IS EQUAL TO SELECTED PRODUCT'S VALUE AND PRODUCT IS IN STOCK

##### Product quantity decreases

##### Product is dispensed

##### Total inserted value is reset


#### WHEN TOTAL INSERTED VALUE IS GREATER THAN SELECTED PRODUCT'S VALUE AND PRODUCT IS IN STOCK

##### Product quantity decreases

##### Product is dispensed

##### Total inserted value is reset

##### Remaining inserted value is given back to the customer


#### WHEN TOTAL INSERTED VALUE IS LESS THAN SELECTED PRODUCT'S VALUE AND PRODUCT IS IN STOCK

##### Product quantity does not change

##### Total inserted value does not change


#### WHEN SELECTED PRODUCT IS NOT IN STOCK

##### Product quantity does not change

##### Product is not dispensed

##### Total inserted value does not change



## Refunds coins

### WHEN TOTAL INSERTED VALUE IS GREATER THAN 0 AND RETURN COINS IS PRESSED

#### Total inserted value is returned to the customer

#### Total inserted value is reset


### WHEN TOTAL INSERTED VALUE IS 0 AND RETURN COINS IS PRESSED

#### Nothing is returned to the customer

#### Total inserted value does not change
end
