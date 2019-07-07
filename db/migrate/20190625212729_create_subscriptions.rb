class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.integer :solo
      t.integer :group

      t.timestamps
    end
  end
end
