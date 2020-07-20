class CreateHierarchies < ActiveRecord::Migration[6.0]
  def change
    create_table :hierarchies do |t|

      t.timestamps
    end
  end
end
