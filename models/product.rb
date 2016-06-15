class Product
  def initialize(args)
    @name = args.fetch(:name) { "" }
    @price = args.fetch(:price) { 0 }
  end
end
