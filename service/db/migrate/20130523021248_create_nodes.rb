class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.references :describer, :polymorphic => true
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth # this is optional.
      t.integer :position
      t.timestamps
    end
  end
end
