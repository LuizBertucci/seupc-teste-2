class AddScreenWidthToNotebooks < ActiveRecord::Migration[6.0]
  def change
    add_column :notebooks, :screen_width, :string
  end
end
