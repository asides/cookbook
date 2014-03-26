module RecipesHelper
	def image_state image
		image.blank? ? "fileinput-new" : "fileinput-exists"
	end
	def if_exists image
		image.blank? ? '' : "fileinput"
	end
	def complexity_options
    [['Очень легко','1'], ['Легко','2'], ['Средне','3'], ['Сложно','4'], ['Мастер-шеф','5']]
    # ['Blog', 'Editorial', 'Announce', 'Advertisement']
  end
end
