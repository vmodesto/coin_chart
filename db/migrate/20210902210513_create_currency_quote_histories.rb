class CreateCurrencyQuoteHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :currency_quote_histories do |t|
      t.decimal :value

      t.timestamps
    end
  end
end
