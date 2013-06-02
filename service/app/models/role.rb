class Role < ActiveRecord::Base
  attr_accessible :code, :name, :description
  has_many :role_permissions
  has_many :permissions, :through => :role_permissions
end
