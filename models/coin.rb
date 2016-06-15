class Coin
  attr_reader :weight, :diameter, :thickness

  def initialize(args = {})
    @weight = args.fetch(:weight) { 0 }
    @diameter = args.fetch(:diameter) { 0 }
    @thickness = args.fetch(:thickness) { 0 }
  end

  def self.is_quarter(coin)
    if coin.kind_of?(Coin) && coin.weight == 5.67 && coin.diameter == 24.26 && coin.thickness == 1.75
      return true
    else
      return false
    end
  end

  def self.is_dime(coin)
    if coin.kind_of?(Coin) && coin.weight == 2.27 && coin.diameter == 17.91 && coin.thickness == 1.35
      return true
    else
      return false
    end
  end

  def self.is_nickel(coin)
    if coin.kind_of?(Coin) && coin.weight == 5 && coin.diameter == 21.21 && coin.thickness == 1.95
      return true
    else
      return false
    end
  end

end
