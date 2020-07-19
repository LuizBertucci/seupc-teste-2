class AddScreenTypesToNotebooks < ActiveRecord::Migration[6.0]
  def change
    add_column :notebooks, :screen_type, :string
  end
end
