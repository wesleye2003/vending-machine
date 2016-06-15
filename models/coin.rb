class Coin
  attr_reader :weight, :diameter, :thickness

  def initialize(args = {})
    @weight = args.fetch(:weight) { 0 }
    @diameter = args.fetch(:diameter) { 0 }
    @thickness = args.fetch(:thickness) { 0 }
  end

  def self.is_quarter(coin)
    if coin.weight == 5.67 && coin.diameter == 24.26 && coin.thickness == 1.75
      return true
    else
      return false
    end
  end

  def is_nickel(inserted_coin)
  end

  def is_dime(inserted_coin)
  end
end
