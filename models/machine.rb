require_relative "coin"
require_relative "product"

class Machine
  attr_accessor :inserted_value
  def initialize
    @inserted_value = 0
  end

  # def coin_is_valid(inserted_coin)
  #   if is_quarter(inserted_coin)
  #     return true
  #   elsif is_nickel(inserted_coin)
  #     return true
  #   elsif is_dime(inserted_coin)
  #     return true
  #   else
  #     return false
  #   end
  # end

end
