# == Schema Information
#
# Table name: recipes
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  description  :text
#  image        :string(255)
#  complexity   :decimal(, )
#  cooking_time :time
#  is_draft     :boolean
#  is_checked   :boolean
#  created_at   :datetime
#  updated_at   :datetime
#

class Recipe < ActiveRecord::Base
	mount_uploader :image, RecipePhotoUploader
	
	has_and_belongs_to_many :categories
	
	has_many :ingredient_lists, dependent: :destroy
	has_many :recipe_parts, dependent: :destroy

	accepts_nested_attributes_for :ingredient_lists, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :recipe_parts, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :categories, reject_if: :all_blank, allow_destroy: true
	#accepts_nested_attributes_for :recipe_photo_uploader

	
	validates :name, presence: true,length: { minimum: 2 }
	# validates_integrity_of :image
	# validates_processing_of :image
	# def categories_assigned
	# 	category_ids.join ","
	# end
	
	# def categories_assigned= ids
	# 	self.categories = Category.find(ids.split(","))
	# end
end
