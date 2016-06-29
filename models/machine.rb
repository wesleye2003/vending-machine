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
      @coins[coin_type] += 1
      @inserted_value += coin.value

      show_inserted_value
    else
      return false
    end
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
      puts "You get #{@inserted_value} cents back."
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
      show_inserted_value
    else
      if @inserted_value - 25 >= 0 && @coins['quarter'] > 0
        @inserted_value -= 25
        @coins['quarter'] -= 1
      elsif @inserted_value - 10 >= 0 && @coins['dime'] > 0
        @inserted_value -= 10
        @coins['dime'] -= 1
      elsif @inserted_value - 5 >= 0 && @coins['nickel'] > 0
        @inserted_value -= 5
        @coins['nickel'] -= 1
      end
      return_inserted_value
    end
  end

end
