class Item < ActiveRecord::Base
  attr_accessible :parent_id, :typeable_type, :typeable_id, :code, :name, :description, :position
  has_one :node, :as => :describer
  validates :code, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :name, :presence => true
end
