class Product
  attr_reader :name, :price
  def initialize(args = {})
    @name = args.fetch(:name) { "" }
    @price = args.fetch(:price) { 0 }
  end
end
