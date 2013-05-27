class NodeRoleAssignment < ActiveRecord::Base
  attr_accessible :node_id, :role_id, :user_id, :group_id
  belongs_to :node, :null => false
  belongs_to :role, :null => false
  belongs_to :user
  belongs_to :group
end
