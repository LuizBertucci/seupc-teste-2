class CreateSuperTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :super_taggings do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :super_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
