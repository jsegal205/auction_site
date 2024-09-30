class AddBlindAuctionToItems < ActiveRecord::Migration[7.2]
  def change
    add_column :items, :blind_auction, :boolean, default: false
  end
end
