class RemoveComplexityFromRecipe < ActiveRecord::Migration
  def change
  	remove_column :recipes, :complexity
  end
end
