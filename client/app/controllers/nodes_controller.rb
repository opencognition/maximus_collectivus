class NodesController < ApplicationController
  require 'rest_client'
  # GET /nodes
  # GET /nodes.json
  def index
    @nodes = Node.find(:all, :params => {:includes => @includes, :conditions => @conditions})
    respond_to do |format|
      format.html # index.html.erb
      format.json {
        render json: {:result => {:data => @nodes, :total => @nodes.count} }
      }
    end
  end

  # GET /nodes/tree
  # GET /nodes/tree.json
  def tree
    @nodes = Node.find(:all, :params => {:includes => @includes << 'children', :conditions => @conditions})
    respond_to do |format|
      format.html # index.html.erb
      format.json {
        render json: {:result => {:data => @nodes, :total => @nodes.count} }
      }
    end
  end
end
