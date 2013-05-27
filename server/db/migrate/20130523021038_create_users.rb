class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uuid, :unique => true, :null => false
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email
      t.timestamps
    end
  end
end
