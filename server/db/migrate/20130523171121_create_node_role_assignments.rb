class CreateNodeRoleAssignments < ActiveRecord::Migration
  def change
    create_table :node_role_assignments do |t|
      t.references :node, :null => false
      t.references :role, :null => false
      t.references :user
      t.references :group
      t.timestamps
    end
  end
end
