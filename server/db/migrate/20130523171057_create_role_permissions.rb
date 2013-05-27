class CreateRolePermissions < ActiveRecord::Migration
  def change
    create_table :role_permissions do |t|
      t.references :role, :null => false
      t.references :permission, :null => false
      t.timestamps
    end
  end
end
