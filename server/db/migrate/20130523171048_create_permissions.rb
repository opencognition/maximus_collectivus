class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :code, :unique => true, :null => false
      t.string :name, :null => false
      t.string :description
      t.timestamps
    end
  end
end
