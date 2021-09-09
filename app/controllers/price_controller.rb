class PriceController < ApplicationController
  def index
    @price = Coin.all

  end

  private

  def getData
    @price.each do |c|
      c.description
      c.value
      c.currency_quote_histories.each do |cur|
        cur.value
      end
    end
  end
end
