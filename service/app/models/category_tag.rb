class CategoryTag < ActiveRecord::Base
  attr_accessible :category_id, :tag_id
  belongs_to :category
  belongs_to :tag
end
