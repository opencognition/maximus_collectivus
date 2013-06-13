class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uuid, :unique => true, :null => false
      t.string :password, :null => false
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email
      t.timestamps
    end
    execute <<-SQL
      ALTER TABLE `users`
        ADD INDEX `I_USERS_EMAIL` (`email` ASC) ;
    SQL
  end
end
