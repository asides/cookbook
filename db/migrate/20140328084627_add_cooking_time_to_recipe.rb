class AddCookingTimeToRecipe < ActiveRecord::Migration
  def change
    add_reference :recipes, :cooking_time, index: true
  end
end
