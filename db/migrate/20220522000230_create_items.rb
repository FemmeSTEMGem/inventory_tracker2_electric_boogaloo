class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false, unique: true
      t.text :description

      t.timestamps
    end
  end
end
