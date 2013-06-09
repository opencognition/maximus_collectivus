class CreateWorkflows < ActiveRecord::Migration
  def change
    create_table :workflows do |t|
      t.references :node, :null => false
      t.references :workflow_status, :null => false
      t.integer :active, :null => false, :default => 1
      t.timestamps
    end
  end
end
