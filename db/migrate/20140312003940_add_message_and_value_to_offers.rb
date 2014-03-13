class AddMessageAndValueToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :message, :blob
    add_column :offers, :value, :float
  end
end
