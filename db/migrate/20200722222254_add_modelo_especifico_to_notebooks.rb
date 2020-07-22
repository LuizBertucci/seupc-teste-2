class AddModeloEspecificoToNotebooks < ActiveRecord::Migration[6.0]
  def change
    add_column :notebooks, :modelo_especifico, :string
  end
end
