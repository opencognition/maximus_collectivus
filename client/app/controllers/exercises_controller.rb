class ExercisesController < ApplicationController
  # GET /exercises
  # GET /exercises.json
  def index
    @exercises = Exercise.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      # format.json { render json: @categories }
      format.json { render json: {:result => {:data => @exercises, :total => @exercises.count} } }
    end
  end
end
