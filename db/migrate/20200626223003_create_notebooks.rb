class CreateNotebooks < ActiveRecord::Migration[6.0]
  def change
    create_table :notebooks do |t|
      t.string :bar_code
      t.string :full_price
      t.string :offer_price
      t.string :brand
      t.string :modelo
      t.string :processor
      t.string :color
      t.string :screen
      t.string :weight
      t.string :ram
      t.string :hd
      t.string :ssd
      t.string :placa_video
      t.string :keyboard
      t.string :amazon_sales_rank
      t.string :guarantee

      t.timestamps
    end
  end
end
