class CreateItemLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :item_locations do |t|
      t.belongs_to :item
      t.belongs_to :location

      t.integer :quantity, default: 0, null: false

      t.timestamps
    end
  end
end
