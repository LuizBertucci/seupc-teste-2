class AddGeneralInfoToNotebooks < ActiveRecord::Migration[6.0]
  def change
    add_column :notebooks, :general_info, :string
  end
end
