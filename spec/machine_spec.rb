# Machine
require_relative "../models/machine"


describe Machine do
  let(:machine) { Machine.new()}
  let(:quarter) { Coin.new({weight: 5.67, diameter: 24.26, thickness: 1.75})}

  describe "#initialize" do
    it "takes no arguments" do
      expect(Machine.instance_method(:initialize).arity).to eq 0
    end

    it "initializes with no money inserted" do
      expect(machine.inserted_value).to eq 0
    end
  end

  describe "#coin_is_taken" do
    it "takes a coin object" do
      expect(machine.coin_is_taken(quarter)).to be true
    end

    it "does not take non-coins" do
      expect(machine.coin_is_taken("rock")).to be false
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
