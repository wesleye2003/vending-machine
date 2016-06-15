require_relative "coin"
require_relative "product"

class Machine
  attr_accessor :inserted_value, :coins
  def initialize
    @inserted_value = 0
    @coins = {quarters: 0, nickels: 0, dimes: 0}
  end

  def add_quarter
    self.coins[:quarters] += 1
  end

  def coin_is_valid(inserted_coin)
    if Coin.is_quarter(inserted_coin)
      return true
    elsif Coin.is_nickel(inserted_coin)
      return true
    elsif Coin.is_dime(inserted_coin)
      return true
    else
      return false
    end
  end

end
