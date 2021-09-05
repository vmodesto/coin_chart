# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_03_144638) do

  create_table "coins", force: :cascade do |t|
    t.string "description"
    t.decimal "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "currency_quote_history_id"
    t.index ["currency_quote_history_id"], name: "index_coins_on_currency_quote_history_id"
  end

  create_table "currency_quote_histories", force: :cascade do |t|
    t.decimal "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "coin_id", null: false
    t.index ["coin_id"], name: "index_currency_quote_histories_on_coin_id"
  end

  add_foreign_key "coins", "currency_quote_histories"
  add_foreign_key "currency_quote_histories", "coins"
end
