class RemoveColumnEventFromPurchases < ActiveRecord::Migration[7.1]
  def change
    remove_column :purchases, :event_id
  end
end
