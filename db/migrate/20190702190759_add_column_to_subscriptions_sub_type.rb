class AddColumnToSubscriptionsSubType < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :sub_type, :string
  end
end
