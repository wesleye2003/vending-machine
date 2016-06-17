require_relative "coin"
require_relative "product"

class Machine
  attr_accessor :inserted_value, :coins, :products
  def initialize
    @inserted_value = 0
    @coins = {'quarter' => 0, 'dime' => 0, 'nickel' => 0}
    @products = []
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

  def add_product(product_to_add)
    if product_to_add.kind_of?(Product)
      self.products.push(product_to_add)
    else
      return false
    end
  end

  def remove_product(product_to_remove)
    self.products.delete_at(self.products.index(product_to_remove))
  end

end
