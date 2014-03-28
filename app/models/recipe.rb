# == Schema Information
#
# Table name: recipes
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  description     :text
#  image           :string(255)
#  is_draft        :boolean
#  is_checked      :boolean
#  created_at      :datetime
#  updated_at      :datetime
#  complexity_id   :integer
#  cooking_time_id :integer
#

class Recipe < ActiveRecord::Base
	mount_uploader :image, RecipePhotoUploader
	
	belongs_to :complexity
	belongs_to :cooking_time

	has_and_belongs_to_many :categories

	has_many :ingredient_lists, dependent: :destroy
	has_many :recipe_parts, dependent: :destroy

	serialize :complexity_options

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
