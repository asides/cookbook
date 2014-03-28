class CreateCookingTimes < ActiveRecord::Migration
  def change
    create_table :cooking_times do |t|
      t.string :title
      t.integer :order

      t.timestamps
    end
  end
end
