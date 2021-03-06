require_relative "../models/product"

describe Product do
  let(:product) { Product.new({name: "Chips", price: 1.50 }) }

  describe "#name" do
    it "returns a product's name" do
      expect(product.name).to eq "Chips"
    end
  end

  describe "#price" do
    it "returns a product's price" do
      expect(product.price).to eq 1.5
    end
  end
end
