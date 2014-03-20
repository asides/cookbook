class CreateIngredientItems < ActiveRecord::Migration
  def change
    create_table :ingredient_items do |t|
      t.decimal :qty
      t.belongs_to :ingredient, index: true
      t.belongs_to :measure, index: true

      t.timestamps
    end
  end
end
