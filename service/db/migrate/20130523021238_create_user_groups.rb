class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.references :user, :null => false
      t.references :group, :null => false
      t.timestamps
    end
    execute <<-SQL
      ALTER TABLE `user_groups`
        ADD CONSTRAINT `FK_USER_GROUPS_USER`
        FOREIGN KEY (`user_id` )
        REFERENCES `users` (`id` )
        ON DELETE NO ACTION
        ON UPDATE NO ACTION, 
        ADD CONSTRAINT `FK_USER_GROUPS_GROUP`
        FOREIGN KEY (`group_id` )
        REFERENCES `groups` (`id` )
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
      , ADD INDEX `I_USER_GROUPS_USER_ID` (`user_id` ASC) 
      , ADD INDEX `I_USER_GROUPS_GROUP_ID` (`group_id` ASC) ;
    SQL
  end
end

# ALTER TABLE `mc_development`.`user_groups` 
#   ADD CONSTRAINT `FK_UG_USER`
#   FOREIGN KEY (`user_id` )
#   REFERENCES `mc_development`.`users` (`id` )
#   ON DELETE NO ACTION
#   ON UPDATE NO ACTION, 
#   ADD CONSTRAINT `FK_UG_GROUP`
#   FOREIGN KEY (`group_id` )
#   REFERENCES `mc_development`.`groups` (`id` )
#   ON DELETE NO ACTION
#   ON UPDATE NO ACTION
# , ADD INDEX `USER_ID_idx` (`user_id` ASC) 
# , ADD INDEX `GROUP_ID_idx` (`group_id` ASC) ;