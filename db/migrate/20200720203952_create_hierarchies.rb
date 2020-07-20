class CreateHierarchies < ActiveRecord::Migration[6.0]
  def change
    create_table :hierarchies do |t|
      t.references :notebook, null: false, foreign_key: true

      t.timestamps
    end
  end
end
