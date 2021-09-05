require 'net/http'

class Coin < ApplicationRecord
  has_many :currency_quote_histories

  def initialize(coin)
    super()
    found_coin = get_coin(coin)
    set_values(found_coin)
  end

  def get_coin(coin)
    ActiveSupport::JSON.decode(Net::HTTP.get(URI("https://api.hgbrasil.com/finance?array_limit=1&fields=#{coin}&key=7f74bc3b")))
  end

  def set_values(found_coin)
    results = found_coin["results"]
    currencies = results["currencies"]
    self.description = currencies["name"]
    self.value = currencies["buy"]
  end
end
