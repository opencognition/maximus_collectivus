class UserNode < ActiveRecord::Base
  self.primary_key = 'id'
  acts_as_nested_set :scope => :user_id
  attr_accessible :describer, :describer_type, :describer_id, :parent_id, :position, :user_id
  belongs_to :describer, :polymorphic => true
  has_many :authorizations
  has_many :groups, :through => :authorizations
  has_many :users, :through => :authorizations
  has_many :roles, :through => :authorizations
  has_many :workflows
  has_many :workflow_statuses, :through => :workflows
  has_many :children, {
          :class_name => self.base_class.to_s,
          :foreign_key => parent_column_name,
          :order => order_column,
          # :conditions => proc {"user_id=#{user_id ? User.user_id : user_id}"}
          :conditions => proc {"describer_id is not null and user_id=#{user_id}" rescue "describer_id is not null and user_id=#{User.user_id}"}
        }
end
