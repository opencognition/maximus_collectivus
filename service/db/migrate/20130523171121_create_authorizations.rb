class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.references :node, :null => false
      t.references :role, :null => false
      t.references :user
      t.references :group
      t.timestamps
    end
    execute <<-SQL
      ALTER TABLE `authorizations`
        ADD CONSTRAINT `FK_AUTHORIZATIONS_NODE`
        FOREIGN KEY (`node_id` )
        REFERENCES `nodes` (`id` )
        ON DELETE NO ACTION
        ON UPDATE NO ACTION, 
        ADD CONSTRAINT `FK_AUTHORIZATIONS_ROLE`
        FOREIGN KEY (`role_id` )
        REFERENCES `roles` (`id` )
        ON DELETE NO ACTION
        ON UPDATE NO ACTION, 
        ADD CONSTRAINT `FK_AUTHORIZATIONS_USER`
        FOREIGN KEY (`user_id` )
        REFERENCES `users` (`id` )
        ON DELETE NO ACTION
        ON UPDATE NO ACTION, 
        ADD CONSTRAINT `FK_AUTHORIZATIONS_GROUP`
        FOREIGN KEY (`group_id` )
        REFERENCES `groups` (`id` )
        ON DELETE NO ACTION
        ON UPDATE NO ACTION, 
        ADD INDEX `I_AUTHORIZATIONS_NODE_ID` (`node_id` ASC) 
        , ADD INDEX `I_AUTHORIZATIONS_ROLE_ID` (`role_id` ASC) 
        , ADD INDEX `I_AUTHORIZATIONS_USER_ID` (`user_id` ASC) 
        , ADD INDEX `I_AUTHORIZATIONS_GROUP_ID` (`group_id` ASC);
    SQL
  end
end

# ALTER TABLE `mc_development`.`authorizations` 
#   ADD CONSTRAINT `FK_A_USER`
#   FOREIGN KEY (`user_id` )
#   REFERENCES `mc_development`.`users` (`id` )
#   ON DELETE NO ACTION
#   ON UPDATE NO ACTION, 
#   ADD CONSTRAINT `FK_A_GROUP`
#   FOREIGN KEY (`group_id` )
#   REFERENCES `mc_development`.`group` (`id` )
#   ON DELETE NO ACTION
#   ON UPDATE NO ACTION, 
#   ADD CONSTRAINT `FK_A_ROLE`
#   FOREIGN KEY (`role_id` )
#   REFERENCES `mc_development`.`roles` (`id` )
#   ON DELETE NO ACTION
#   ON UPDATE NO ACTION, 
#   ADD CONSTRAINT `FK_A_NODE`
#   FOREIGN KEY (`node_id` )
#   REFERENCES `mc_development`.`nodes` (`id` )
#   ON DELETE NO ACTION
#   ON UPDATE NO ACTION
# , ADD INDEX `USER_ID_idx` (`user_id` ASC) 
# , ADD INDEX `GROUP_ID_idx` (`group_id` ASC) 
# , ADD INDEX `ROLE_ID_idx` (`role_id` ASC) 
# , ADD INDEX `NODE_ID_idx` (`node_id` ASC) ;
