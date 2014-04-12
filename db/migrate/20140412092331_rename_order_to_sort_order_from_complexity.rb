class RenameOrderToSortOrderFromComplexity < ActiveRecord::Migration
  def change
  	rename_column :complexities, :order, :sort_order
  end
end
