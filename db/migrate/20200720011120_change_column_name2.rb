class ChangeColumnName2 < ActiveRecord::Migration[6.0]
  def change
    rename_column :notebooks, :screen_type, :screen_quality
  end
end
