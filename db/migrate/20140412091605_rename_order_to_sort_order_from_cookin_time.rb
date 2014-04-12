class RenameOrderToSortOrderFromCookinTime < ActiveRecord::Migration
  def change
  	rename_column :cooking_times, :order, :sort_order
  end
end
