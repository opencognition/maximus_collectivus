class User < ActiveRecord::Base
  attr_accessible :uuid, :first_name, :middle_name, :last_name, :email, :password
  has_many :authorizations
  has_many :expanded_authorizations
  has_many :user_groups
  has_many :groups, :through => :user_groups
  has_many :user_nodes
end
