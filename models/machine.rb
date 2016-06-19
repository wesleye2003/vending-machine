require_relative "coin"
require_relative "product"
require_relative "../views/display"

class Machine
  include Display
  attr_accessor :inserted_value, :coins, :products, :display
  def initialize
    @inserted_value = 0
    @coins = {'quarter' => 0, 'dime' => 0, 'nickel' => 0}
    @products = []
    @display = ''
  end

  def add_coin(coin)
    coin_type = Coin.valid_type(coin)

    if coin_type
      self.coins[coin_type] += 1

      ##### vvv NEEDS REFACTOR vvv #####
      if coin_type == "quarter"
        self.inserted_value += 25
      elsif coin_type == "dime"
        self.inserted_value += 10
      elsif coin_type == "nickel"
        self.inserted_value += 5
      end
      ##### ^^^ NEEDS REFACTOR ^^^ #####

      self.show_inserted_value
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

  def in_stock?(selected_product)
    self.products.select { |product| product == selected_product }.length > 0
  end

  def try_to_sell(selected_product)
    if self.in_stock?(selected_product) && self.inserted_value >= selected_product.price
      self.inserted_value -= selected_product.price
      self.remove_product(selected_product)
      return_inserted_value
      self.display = "THANK YOU"

    elsif self.in_stock?(selected_product) && self.inserted_value < selected_product.price
      # DO DISPLAY THING
    else
      return false
    end

  end

  def return_inserted_value
    if self.inserted_value == 0
      return true
    else
      if self.inserted_value - 25 >= 0 && self.coins['quarter'] > 0
        self.inserted_value -= 25
        self.coins['quarter'] -= 1
      elsif self.inserted_value - 10 >= 0 && self.coins['dime'] > 0
        self.inserted_value -= 10
        self.coins['dime'] -= 1
      elsif self.inserted_value - 5 >= 0 && self.coins['nickel'] > 0
        self.inserted_value -= 5
        self.coins['nickel'] -= 1
      end
      self.return_inserted_value
    end
  end

end
