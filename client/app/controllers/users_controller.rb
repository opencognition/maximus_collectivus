class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.find(:all, :params => {:foo => "bar"})

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
end
