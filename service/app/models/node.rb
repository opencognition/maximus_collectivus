class Node < ActiveRecord::Base
  acts_as_nested_set
  attr_accessible :describer, :describer_type, :describer_id, :parent_id, :position
  belongs_to :describer, :polymorphic => true
end
