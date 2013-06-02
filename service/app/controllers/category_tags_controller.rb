class CategoryTagsController < ApplicationController
  # GET /category_tags
  # GET /category_tags.json
  def index
    @category_tags = CategoryTag.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @category_tags }
    end
  end

  # GET /category_tags/1
  # GET /category_tags/1.json
  def show
    @category_tag = CategoryTag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category_tag }
    end
  end

  # POST /category_tags
  # POST /category_tags.json
  def create
    @category_tag = CategoryTag.new(params[:category_tag])

    respond_to do |format|
      if @category_tag.save
        format.html { redirect_to @category_tag, notice: 'CategoryTag was successfully created.' }
        format.json { render json: @category_tag, status: :created, location: @category_tag }
      else
        format.html { render action: "new" }
        format.json { render json: @category_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /category_tags/1
  # PUT /category_tags/1.json
  def update
    @category_tag = CategoryTag.find(params[:id])

    respond_to do |format|
      if @category_tag.update_attributes(params[:category_tag])
        format.html { redirect_to @category_tag, notice: 'CategoryTag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_tags/1
  # DELETE /category_tags/1.json
  def destroy
    @category_tag = CategoryTag.find(params[:id])
    @category_tag.destroy

    respond_to do |format|
      format.html { redirect_to category_tags_url }
      format.json { head :no_content }
    end
  end
end
