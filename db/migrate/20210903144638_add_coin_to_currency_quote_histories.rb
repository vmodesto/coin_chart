class AddCoinToCurrencyQuoteHistories < ActiveRecord::Migration[6.1]
  def change
    add_reference :currency_quote_histories, :coin, null: false, foreign_key: true
  end
end
