class CreateSavedNotebooks < ActiveRecord::Migration[6.0]
  def change
    create_table :saved_notebooks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :notebook, null: false, foreign_key: true

      t.timestamps
    end
  end
end
