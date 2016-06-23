class Coin
  attr_reader :weight, :diameter, :thickness
  attr_accessor :value

  def initialize(args = {})
    @weight = args.fetch(:weight) { 0 }
    @diameter = args.fetch(:diameter) { 0 }
    @thickness = args.fetch(:thickness) { 0 }
    @value = 0
  end

  def self.valid_type(coin)
    if coin.kind_of?(Coin) && coin.weight == 5.67 && coin.diameter == 24.26 && coin.thickness == 1.75
      coin.value = 25
      return "quarter"
    elsif coin.kind_of?(Coin) && coin.weight == 2.27 && coin.diameter == 17.91 && coin.thickness == 1.35
      coin.value = 10
      return "dime"
    elsif coin.kind_of?(Coin) && coin.weight == 5 && coin.diameter == 21.21 && coin.thickness == 1.95
      coin.value = 5
      return "nickel"
    else
      return false
    end
  end

end
