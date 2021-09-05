class AddCurrencyQuoteHistoriesToCoins < ActiveRecord::Migration[6.1]
  def change
    add_reference :coins, :currency_quote_history, foreign_key: true
  end
end
