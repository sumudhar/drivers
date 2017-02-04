class AddColumnToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations,:accuracy,:decimal
  end
end
