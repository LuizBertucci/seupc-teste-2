class CreateSuperTags < ActiveRecord::Migration[6.0]
  def change
    create_table :super_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
