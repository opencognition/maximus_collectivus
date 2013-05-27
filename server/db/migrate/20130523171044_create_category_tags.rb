class CreateCategoryTags < ActiveRecord::Migration
  def change
    create_table :category_tags do |t|
      t.references :category, :null => false
      t.references :tag, :null => false
      t.timestamps
    end
  end
end
