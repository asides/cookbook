class RecipePartsController < ApplicationController
  before_action :set_recipe_part, only: [:show, :edit, :update, :destroy]

  # GET /recipe_parts
  # GET /recipe_parts.json
  def index
    @recipe_parts = RecipePart.all
  end

  # GET /recipe_parts/1
  # GET /recipe_parts/1.json
  def show
  end

  # GET /recipe_parts/new
  def new
    @recipe_part = RecipePart.new
  end

  # GET /recipe_parts/1/edit
  def edit
  end

  # POST /recipe_parts
  # POST /recipe_parts.json
  def create
    @recipe_part = RecipePart.new(recipe_part_params)

    respond_to do |format|
      if @recipe_part.save
        format.html { redirect_to @recipe_part, notice: 'Recipe part was successfully created.' }
        format.json { render action: 'show', status: :created, location: @recipe_part }
      else
        format.html { render action: 'new' }
        format.json { render json: @recipe_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_parts/1
  # PATCH/PUT /recipe_parts/1.json
  def update
    respond_to do |format|
      if @recipe_part.update(recipe_part_params)
        format.html { redirect_to @recipe_part, notice: 'Recipe part was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @recipe_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_parts/1
  # DELETE /recipe_parts/1.json
  def destroy
    @recipe_part.destroy
    respond_to do |format|
      format.html { redirect_to recipe_parts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_part
      @recipe_part = RecipePart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_part_params
      params.require(:recipe_part).permit(:image, :description, :recipe_id)
    end
end
