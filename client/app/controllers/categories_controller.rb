class CategoriesController < ApplicationController
  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      # format.json { render json: @categories }
      format.json { render json: {:result => {:data => @categories, :total => @categories.count} } }
    end
  end
end