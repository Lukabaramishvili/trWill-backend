class RemoveColumnFromSubscription < ActiveRecord::Migration[5.2]
  def change
    remove_column :subscriptions, :solo, :integer
    remove_column :subscriptions, :group, :integer
  end
end
