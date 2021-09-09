require 'net/http'

class Coin < ApplicationRecord
  has_many :currency_quote_histories

  def initialize(coin)
    super()
    found_coin = get_coin(coin)
    set_values(found_coin)
  end

  def set_values(found_coin)
    results = found_coin["results"]
    currencies = results["currencies"]
    self.description = currencies["name"]
    self.value = currencies["buy"]
  end
end
