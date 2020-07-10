class AddLinkAmazonToNotebook < ActiveRecord::Migration[6.0]
  def change
    add_column :notebooks, :link_amazon, :string
  end
end
