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

# ALTER TABLE `mc_development`.`nodes` 
# ADD INDEX `I_N_PARENT_ID` (`parent_id` ASC) 
# , ADD INDEX `I_N_DESCRIBER_TYPE` (`describer_type` ASC) 
# , ADD INDEX `I_N_DESCRIBER_ID` (`describer_id` ASC) 
# , ADD INDEX `I_N_LFT` (`lft` ASC) 
# , ADD INDEX `I_N_RGT` (`rgt` ASC) ;
