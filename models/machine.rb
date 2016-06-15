require_relative "coin"
require_relative "product"

class Machine
  attr_accessor :inserted_value
  def initialize
    @inserted_value = 0
  end
end
