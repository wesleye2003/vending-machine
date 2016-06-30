class Coin
  attr_reader :weight, :diameter, :thickness
  attr_accessor :value

  def initialize(args = {})
    @weight = args.fetch(:weight) { 0 }
    @diameter = args.fetch(:diameter) { 0 }
    @thickness = args.fetch(:thickness) { 0 }
  end
  
end
