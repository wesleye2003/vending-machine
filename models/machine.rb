require_relative "coin"
require_relative "product"

class Machine
  attr_accessor :inserted_value, :coins
  def initialize
    @inserted_value = 0
    @coins = {'quarter' => 0, 'dime' => 0, 'nickel' => 0}
  end

  def add_coin(coin)
    coin_type = Coin.valid_type(coin)

    if coin_type
      self.coins[coin_type] += 1
      ##### vvv NEEDS REFACTOR vvv #####
      if coin_type == "quarter"
        self.inserted_value += 0.25
      elsif coin_type == "dime"
        self.inserted_value += 0.1
      elsif coin_type == "nickel"
        self.inserted_value += 0.05
      end
      ##### ^^^ NEEDS REFACTOR ^^^ #####
    else
      return false
    end
  end
end
