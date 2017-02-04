class CreateDrivers < ActiveRecord::Migration[5.0]
  def change
    create_table :drivers do |t|
      t.string :last_name
      t.string :first_name
      t.string :phone

      t.timestamps
    end
  end
end
