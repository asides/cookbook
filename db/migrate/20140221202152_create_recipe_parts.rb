class CreateRecipeParts < ActiveRecord::Migration
  def change
    create_table :recipe_parts do |t|
      t.string :image
      t.text :description
      t.belongs_to :recipe, index: true

      t.timestamps
    end
  end
end
