class ExpandedAuthorization < ActiveRecord::Base
    attr_accessible :role, :node, :user, :node_id, :role_id, :user_id
    belongs_to :node
    belongs_to :role
    belongs_to :user
    validates :node, :presence => true
    validates :role, :presence => true
    # validates_uniqueness_of :node, :scope => [:role_id, :user_id, :group_id]
    # validates_uniqueness_of :role, :scope => [:node_id, :user_id, :group_id]
end
