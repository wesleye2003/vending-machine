module Display
  def show_inserted_value
    if self.inserted_value > 0
      self.display = self.inserted_value/100.to_f
    else
      self.display = "INSERT COIN"
    end
  end

  def not_enough_for(item)
    self.display = "PRICE \n #{item.price/100.to_f}"
  end
end
