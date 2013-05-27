class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :code, :unique => true
      t.string :name, :null => false
      t.string :description
      t.timestamps
    end
  end
end
