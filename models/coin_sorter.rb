module CoinSorter
  def self.valid_type(coin)
    if coin.kind_of?(Coin) && coin.weight == 5.67 && coin.diameter == 24.26 && coin.thickness == 1.75
      return 25
    elsif coin.kind_of?(Coin) && coin.weight == 2.27 && coin.diameter == 17.91 && coin.thickness == 1.35
      return 10
    elsif coin.kind_of?(Coin) && coin.weight == 5 && coin.diameter == 21.21 && coin.thickness == 1.95
      return 5
    else
      return nil
    end
  end
end
