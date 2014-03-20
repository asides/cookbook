class AddNestedSetColumnsToPages < ActiveRecord::Migration
  NESTED_SET_COLUMNS = [:parent_id, :lft, :rgt, :depth]

  def up
  	
    NESTED_SET_COLUMNS.each do |column|
      add_column :categories, column, :integer
    end

    if defined?(Category) && Category.respond_to?(:rebuild!)
      Category.rebuild!
    end
  end

  def down
    NESTED_SET_COLUMNS.each do |column|
      remove_column :categories, column
    end
  end
end