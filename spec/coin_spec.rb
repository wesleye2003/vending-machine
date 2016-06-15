require_relative "../models/coin"
# Coin
describe Coin do
  let(:coin) { Coin.new() }

  describe "#initialize" do
    it "takes two arguments" do
      expect(Coin.instance_method(:initialize).arity).to eq 2
    end
  end

  describe "#weight" do
    xit "returns a coin's weight" do
    end
  end

  describe "#diameter" do
    xit "returns a coin's diameter" do
    end
  end
end


## Know their weight

## Know their size
