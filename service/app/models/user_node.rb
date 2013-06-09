class UserNode < ActiveRecord::Base
  self.primary_key = 'id'
  acts_as_nested_set
  # attr_accessible :describer, :describer_type, :describer_id, :parent_id, :position
  belongs_to :describer, :polymorphic => true
  has_many :authorizations
  has_many :groups, :through => :authorizations
  has_many :users, :through => :authorizations
  has_many :roles, :through => :authorizations
  has_many :workflows
  has_many :workflow_statuses, :through => :workflows
end
