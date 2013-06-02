class RolePermission < ActiveRecord::Base
  attr_accessible :role_id, :permission_id
  belongs_to :role
  belongs_to :permission
end
