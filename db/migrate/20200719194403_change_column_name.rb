class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :notebooks, :screen, :screen_size
  end
end
