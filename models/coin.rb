class Coin
  attr_reader :weight, :diameter, :thickness
  def initialize(weight, diameter, thickness)
    @weight = weight
    @diameter = diameter
    @thickness = thickness
  end
end
