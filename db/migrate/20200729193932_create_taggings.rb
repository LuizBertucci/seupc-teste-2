class CreateTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :taggings do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :notebook, null: false, foreign_key: true

      t.timestamps
    end
  end
end
