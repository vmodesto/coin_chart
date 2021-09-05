class CreateCoins < ActiveRecord::Migration[6.1]
  def change
    create_table :coins do |t|
      t.string :description
      t.decimal :value

      t.timestamps
    end
  end
end
