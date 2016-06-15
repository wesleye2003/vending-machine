require_relative "../models/product"

describe Product do
  let(:product) { Product.new({name: "Chips", price: 1.50 }) }

  describe "#initialize" do
    it "takes two arguments" do
      expect(Product.instance_method(:initialize).arity).to eq 1
    end
  end

  describe "#name" do
    xit "returns a product's name" do

    end
  end

  describe "#price" do
    xit "returns a product's price" do

    end
  end
end


## Product has a price

## Product has a name
