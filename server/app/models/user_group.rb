class UserGroup < ActiveRecord::Base
  attr_accessible :user, :group, :user_id, :group_id
  belongs_to :user
  belongs_to :group
end
