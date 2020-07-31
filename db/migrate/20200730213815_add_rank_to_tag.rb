class AddRankToTag < ActiveRecord::Migration[6.0]
  def change
    add_column :tags, :rank, :integer
  end
end
