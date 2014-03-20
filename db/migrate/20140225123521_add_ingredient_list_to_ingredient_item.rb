class AddIngredientListToIngredientItem < ActiveRecord::Migration
  def change
  	add_reference :ingredient_items, :ingredient_list, index: true
  end
end
