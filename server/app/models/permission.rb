class Permission < ActiveRecord::Base
  attr_accessible :code, :name, :description
  has_many :role_permissions
  has_many :roles, :through => :role_permissions
  validates :code, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :name, :presence => true
end
