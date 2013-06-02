class Tag < ActiveRecord::Base
  attr_accessible :code, :name, :description
  has_many :category_tags
  has_many :categories, :through => :category_tags
end
