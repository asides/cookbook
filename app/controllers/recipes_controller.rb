class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    
    list = @recipe.ingredient_lists.build
    items = list.ingredient_items.build
    items.ingredient = Ingredient.new

    @recipe.recipe_parts.build

    #@recipe.categories =  Category.roots
    @categories = Category.roots
  end

  # GET /recipes/1/edit
  def edit

    #@recipe.categories ||= Category.roots
    
    unless @recipe.ingredient_lists.present?
      il = @recipe.ingredient_lists.build
      it = il.ingredient_items.build
      it.ingredient = Ingredient.new
    end

    @recipe.recipe_parts.build unless @recipe.recipe_parts.present?
    @recipe.recipes_categories.build unless @recipe.categories.present?
    # respond_to
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipes_url, notice: 'Recipe was successfully created.' }
        format.json { render action: 'show', status: :created, location: @recipe }
      else
        format.html { render action: 'new' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    # recipe_params[:ingredient_lists_attributes].each do |list|
    #   list.each do |item|
    #     item[:ingredient_attributes] = Ingredient.where(name: item[:ingredient_attributes].name).first_or_create
    #   end
    # end
    
    # category_ids = params[:recipe][:categories_attributes].map { |k,v| v[:id] }
    # #pry.debugger
    
    # recipe_params.merge({ category_ids: category_ids })
    

    respond_to do |format|
      
      if @recipe.update(recipe_params)
        format.html { redirect_to recipes_url, notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      
      params.require(:recipe).permit(:name, :description, :image, :image_cache, :remove_image, 
        :cook_time, :complexity_id, :cooking_time_id, :is_draft, :is_checked, {category_ids: []},
        recipes_categories_attributes: [:id, :category_id, :_destroy],
        categories_attributes: [:id, :title, :_destroy], 
        recipe_parts_attributes: [:id, :image, :remove_image, :image_cache, :description, :_destroy], 
        ingredient_lists_attributes: [:id, :name, :_destroy, 
          ingredient_items_attributes:[:id, :qty, :measure_id, :ingredient_id, :_destroy, 
            ingredient_attributes:[:id, :name]]])
    end
end
