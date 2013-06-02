class NodeRoleAssignmentsController < ApplicationController
  # GET /node_role_assignments
  # GET /node_role_assignments.json
  def index
    @node_role_assignments = NodeRoleAssignment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @node_role_assignments }
    end
  end

  # GET /node_role_assignments/1
  # GET /node_role_assignments/1.json
  def show
    @node_role_assignment = NodeRoleAssignment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @node_role_assignment }
    end
  end

  # POST /node_role_assignments
  # POST /node_role_assignments.json
  def create
    @node_role_assignment = NodeRoleAssignment.new(params[:node_role_assignment])

    respond_to do |format|
      if @node_role_assignment.save
        format.html { redirect_to @node_role_assignment, notice: 'NodeRoleAssignment was successfully created.' }
        format.json { render json: @node_role_assignment, status: :created, location: @node_role_assignment }
      else
        format.html { render action: "new" }
        format.json { render json: @node_role_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /node_role_assignments/1
  # PUT /node_role_assignments/1.json
  def update
    @node_role_assignment = NodeRoleAssignment.find(params[:id])

    respond_to do |format|
      if @node_role_assignment.update_attributes(params[:node_role_assignment])
        format.html { redirect_to @node_role_assignment, notice: 'NodeRoleAssignment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @node_role_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /node_role_assignments/1
  # DELETE /node_role_assignments/1.json
  def destroy
    @node_role_assignment = NodeRoleAssignment.find(params[:id])
    @node_role_assignment.destroy

    respond_to do |format|
      format.html { redirect_to node_role_assignments_url }
      format.json { head :no_content }
    end
  end
end
