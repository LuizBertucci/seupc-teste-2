class AddMagaluPriceSubmarinoPriceAmericanasPriceToNotebooks < ActiveRecord::Migration[6.0]
  def change
    add_column :notebooks, :magalu_price, :string
    add_column :notebooks, :americanas_price, :string
    add_column :notebooks, :submarino_price, :string
  end
end
