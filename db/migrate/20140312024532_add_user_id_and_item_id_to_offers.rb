class AddUserIdAndItemIdToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :user_id, :integer
    add_column :offers, :item_id, :integer
  end
end
