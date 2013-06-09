class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.references :node, :null => false
      t.references :role, :null => false
      t.references :user
      t.references :group
      t.timestamps
    end
  end
end
