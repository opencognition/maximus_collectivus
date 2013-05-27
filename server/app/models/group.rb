class Group < ActiveRecord::Base
  attr_accessible :code, :name, :description
  has_many :user_groups
  has_many :users, :through => :user_groups
  validates :code, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :name, :presence => true
end
