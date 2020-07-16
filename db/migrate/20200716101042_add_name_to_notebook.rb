class AddNameToNotebook < ActiveRecord::Migration[6.0]
  def change
    add_column :notebooks, :name, :string
  end
end
