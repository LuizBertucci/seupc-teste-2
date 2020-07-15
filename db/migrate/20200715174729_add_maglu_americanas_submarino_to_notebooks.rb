class AddMagluAmericanasSubmarinoToNotebooks < ActiveRecord::Migration[6.0]
  def change
    add_column :notebooks, :link_magalu, :string
    add_column :notebooks, :link_submarino, :string
    add_column :notebooks, :link_americanas, :string
  end
end
