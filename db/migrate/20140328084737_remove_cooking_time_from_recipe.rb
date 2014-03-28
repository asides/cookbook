class RemoveCookingTimeFromRecipe < ActiveRecord::Migration
  def change
  	remove_column :recipes, :cooking_time
  end
end
