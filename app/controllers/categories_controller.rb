class CategoriesController < ApplicationController
  include TheSortableTreeController::Rebuild
  include TheSortableTreeController::ExpandNode

  before_action :set_category , only: [:show, :edit, :update, :destroy, :nested]

  def nested_options
    @categories = Category.nested_set.select('id, title, parent_id').limit(15)
  end

  def manage
    @categories = Category.nested_set.select('id, title, parent_id')
  end

  def node_manage
    @root = Category.root
    @categories = @root.self_and_descendants.nested_set.select('id, title, parent_id').limit(15)
    render template: 'categories/manage'
  end

  def nested
    @categories = @category.children.select('id, title')
    render 'categories/nested', layout: false
  end

  def expand
    @categories = Category.nested_set.roots.select('id, title, parent_id')
  end

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @recipes = @category.recipes.where is_draft: false
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: 'Category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @category }
      else
        format.html { render action: 'new' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_path, notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:title, :parent_id, :lft, :rgt, :depth)
    end
end
