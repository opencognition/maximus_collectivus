class Category < ActiveRecord::Base
  attr_accessible :code, :name, :description
  has_one :node, :as => :describer
  has_many :category_tags
  has_many :tags, :through => :category_tags
  validates :code, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :name, :presence => true
end
