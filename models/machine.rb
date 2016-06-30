require_relative "coin"
require_relative "product"
require_relative "coin_sorter"
require_relative "../views/display"

class Machine
  include CoinSorter
  include Display
  attr_accessor :inserted_value, :coins, :products, :display
  def initialize
    @inserted_value = 0
    @coins = {25 => 0, 10 => 0, 5 => 0}
    @products = []
    @display = ''
  end

  def add_product(product_to_add)
    if product_to_add.kind_of?(Product)
      @products.push(product_to_add)
    else
      return false
    end
  end

  def remove_product(product_to_remove)
    @products.delete_at(@products.index(product_to_remove))
  end

  def in_stock?(selected_product)
    @products.select { |product| product == selected_product }.length > 0
  end

  def try_to_sell(selected_product)
    if in_stock?(selected_product) && @inserted_value >= selected_product.price
      @inserted_value -= selected_product.price
      remove_product(selected_product)
      return_inserted_value
      @display = "THANK YOU"

    elsif in_stock?(selected_product) && @inserted_value < selected_product.price
      not_enough_for(selected_product)
    else
      @display = "SOLD OUT"
    end

  end

  def return_inserted_value
    if @inserted_value == 0
      return true
    else
      if @inserted_value - 25 >= 0 && @coins[25] > 0
        @inserted_value -= 25
        @coins[25] -= 1
      elsif @inserted_value - 10 >= 0 && @coins[10] > 0
        @inserted_value -= 10
        @coins[10] -= 1
      elsif @inserted_value - 5 >= 0 && @coins[5] > 0
        @inserted_value -= 5
        @coins[5] -= 1
      end
      return_inserted_value
    end
  end

end
