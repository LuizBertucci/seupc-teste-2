class AddAsinToNotebooks < ActiveRecord::Migration[6.0]
  def change
    add_column :notebooks, :asin, :string
  end
end
