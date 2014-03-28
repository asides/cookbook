class AddComplexityToRecipe < ActiveRecord::Migration
  def change
    add_reference :recipes, :complexity, index: true
  end
end
