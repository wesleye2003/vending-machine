require_relative "coin"
require_relative "product"

class Machine
  attr_accessor :inserted_value
  def initialize
    @inserted_value = 0
  end

  def coin_is_taken(coin)
    if coin.kind_of?(Coin)
      return true
    else
      return false
    end
  end
end
