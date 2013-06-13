class CreateRolePermissions < ActiveRecord::Migration
  def change
    create_table :role_permissions do |t|
      t.references :role, :null => false
      t.references :permission, :null => false
      t.timestamps
    end
  end
end

# ALTER TABLE `mc_development`.`role_permissions` 
#   ADD CONSTRAINT `FK_RP_ROLE`
#   FOREIGN KEY (`role_id` )
#   REFERENCES `mc_development`.`roles` (`id` )
#   ON DELETE NO ACTION
#   ON UPDATE NO ACTION, 
#   ADD CONSTRAINT `FK_RP_PERMISSION`
#   FOREIGN KEY (`permission_id` )
#   REFERENCES `mc_development`.`permissions` (`id` )
#   ON DELETE NO ACTION
#   ON UPDATE NO ACTION
# , ADD INDEX `FK_RP_ROLE_idx` (`role_id` ASC) 
# , ADD INDEX `FK_RP_PERMISSION_idx` (`permission_id` ASC) ;