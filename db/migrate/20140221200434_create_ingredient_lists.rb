class CreateIngredientLists < ActiveRecord::Migration
  def change
    create_table :ingredient_lists do |t|
      t.string :name
      t.belongs_to :ingredient_item, index: true
      t.belongs_to :recipe, index: true

      t.timestamps
    end
  end
end
