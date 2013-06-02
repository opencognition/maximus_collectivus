class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.references :user, :null => false
      t.references :group, :null => false
      t.timestamps
    end
  end
end
