class AddPositionToNotebooks < ActiveRecord::Migration[6.0]
  def change
    add_column :notebooks, :position, :integer
    Notebook.order(:updated_at).each.with_index(1) do |notebook, index|
      notebook.update_column :position, index
    end  
  end
end
