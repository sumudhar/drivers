class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.decimal :longitude , precision: 15, scale: 10
      t.decimal :latitude , precision: 15, scale: 10
      t.integer :driver_id

      t.timestamps
    end
  end
end
