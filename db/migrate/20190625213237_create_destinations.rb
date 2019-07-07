class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.integer :price
      t.string :location
      t.string :description
      t.string :timeframe
      t.string :image

      t.timestamps
    end
  end
end
