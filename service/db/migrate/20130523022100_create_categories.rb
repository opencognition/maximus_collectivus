class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :code, :unique => true, :null => false
      t.string :name, :null => false
      t.string :description
      t.timestamps
    end
  end
end
