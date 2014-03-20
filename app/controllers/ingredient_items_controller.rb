class IngredientItemsController < ApplicationController
  before_action :set_ingredient_item, only: [:show, :edit, :update, :destroy]

  # GET /ingredient_items
  # GET /ingredient_items.json
  def index
    @ingredient_items = IngredientItem.all
  end

  # GET /ingredient_items/1
  # GET /ingredient_items/1.json
  def show
  end

  # GET /ingredient_items/new
  def new
    @ingredient_item = IngredientItem.new
    @ingredient_item.ingredient_build
  end

  # GET /ingredient_items/1/edit
  def edit
  end

  # POST /ingredient_items
  # POST /ingredient_items.json
  def create
    @ingredient_item = IngredientItem.new(ingredient_item_params)

    respond_to do |format|
      if @ingredient_item.save
        format.html { redirect_to @ingredient_item, notice: 'Ingredient item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ingredient_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @ingredient_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredient_items/1
  # PATCH/PUT /ingredient_items/1.json
  def update
    respond_to do |format|
      if @ingredient_item.update(ingredient_item_params)
        format.html { redirect_to @ingredient_item, notice: 'Ingredient item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ingredient_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredient_items/1
  # DELETE /ingredient_items/1.json
  def destroy
    @ingredient_item.destroy
    respond_to do |format|
      format.html { redirect_to ingredient_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient_item
      @ingredient_item = IngredientItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_item_params
      params.require(:ingredient_item).permit(:qty, :ingredient_id, :measure_id)
    end
end
