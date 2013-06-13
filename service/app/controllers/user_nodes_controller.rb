class UserNodesController < ApplicationController
  # GET /user_nodes
  # GET /user_nodes.json
  def index
    @conditions[:parent_id] = nil if @conditions.has_key?(:parent_id) and @conditions[:parent_id].blank?
    @conditions[:user_id] = @cas_user.id
    @user_nodes = UserNode.includes(@includes.split(",")).where(@conditions)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_nodes, :methods => @includes }
    end
  end

  # GET /user_nodes/tree
  # GET /user_nodes/tree.json
  def tree
    @conditions[:parent_id] = nil if @conditions.has_key?(:parent_id) and @conditions[:parent_id].blank?
    @conditions[:user_id] = @cas_user.id
    @user_nodes = UserNode.includes(@includes.split(",")).where(@conditions)

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @user_nodes, :methods => @includes }
    # end
    respond_to do |format|
      format.html # index.html.erb
      if params[:callback]
        format.json { render json: @user_nodes, :methods => @includes, :callback => params[:callback] }
      else
        format.json { render json: @user_nodes, :methods => @includes }
      end
    end
  end

  # GET /user_nodes/1
  # GET /user_nodes/1.json
  def show
    @user_node = UserNode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_node }
    end
  end

  # GET /nodes/new
  # GET /nodes/new.json
  def new
    render :status => 405 # Method Not Allowed
  end

  # GET /nodes/1/edit
  def edit
    render :status => 405 # Method Not Allowed
  end

  # POST /nodes
  # POST /nodes.json
  def create
    render :status => 405 # Method Not Allowed
  end

  # PUT /nodes/1
  # PUT /nodes/1.json
  def update
    render :status => 405 # Method Not Allowed
  end

  # DELETE /nodes/1
  # DELETE /nodes/1.json
  def destroy
    render :status => 405 # Method Not Allowed
  end
end
