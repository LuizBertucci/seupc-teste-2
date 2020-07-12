class AddEditedToNotebook < ActiveRecord::Migration[6.0]
  def change
    add_column :notebooks, :edited, :boolean
  end



end
