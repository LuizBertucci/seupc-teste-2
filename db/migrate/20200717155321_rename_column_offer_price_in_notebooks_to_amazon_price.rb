class RenameColumnOfferPriceInNotebooksToAmazonPrice < ActiveRecord::Migration[6.0]
  def change
    rename_column :notebooks, :offer_price, :amazon_price
  end
end
