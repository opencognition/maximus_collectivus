class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :code, :unique => true
      t.string :name, :null => false
      t.string :description
      t.timestamps
    end
  end
end
