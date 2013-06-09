class WorkflowStatus < ActiveRecord::Base
  attr_accessible :code, :name, :description
  has_many :workflows
  has_many :nodes, :through => :workflows, :conditions => "active = 1"
  validates :code, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :name, :presence => true
end
