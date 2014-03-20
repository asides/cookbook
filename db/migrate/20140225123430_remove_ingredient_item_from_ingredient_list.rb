class RemoveIngredientItemFromIngredientList < ActiveRecord::Migration
  def change
  	remove_column :ingredient_lists, :ingredient_item_id
  end
end
