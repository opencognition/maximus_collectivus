class Exercise < ActiveRecord::Base
  attr_accessible :code, :name, :description
  has_one :node, :as => :describer
  validates :code, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :name, :presence => true
end
