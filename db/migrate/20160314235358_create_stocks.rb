class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
   