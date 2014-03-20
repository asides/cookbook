class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.string :image
      t.decimal :complexity
      t.time :cooking_time
      t.boolean :is_draft
      t.boolean :is_checked

      t.timestamps
    end
  end
end
