class Workflow < ActiveRecord::Base
    attr_accessible :node, :workflow_status, :active
    belongs_to :node
    belongs_to :workflow_status
    validates :node, :presence => true
    validates :workflow_status, :presence => true

    around_create :do_around_create

    private
    def do_around_create
        # do some "before_create" stuff here

        yield  # this makes the save happen

        # do some "after_create" stuff here
        Workflow.update_all({:active => 0}, ["id != ? and active = ? and node_id = ?", self.id, 1, self.node_id])
    end
end
