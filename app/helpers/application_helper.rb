module ApplicationHelper
	def categories_tree
		Category.nested_set.select(:id, :title, :parent_id)
	end
end
