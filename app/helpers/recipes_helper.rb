module RecipesHelper
	def image_state image
		image.blank? ? "fileinput-new" : "fileinput-exists"
	end
	def if_exists image
		image.blank? ? '' : "fileinput"
	end
end
