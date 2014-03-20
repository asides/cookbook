# == Schema Information
#
# Table name: ingredient_lists
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  recipe_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class IngredientList < ActiveRecord::Base
	
	before_save :set_name

  belongs_to :recipe
  
  has_many :ingredient_items, dependent: :destroy
	#has_many :ingredients, through: :ingredient_items
  
  accepts_nested_attributes_for :ingredient_items, reject_if: :all_blank, allow_destroy: true
  #accepts_nested_attributes_for :ingredients, reject_if: :all_blank
  private
  	def set_name
  		self.name = self.name.mb_chars.capitalize unless self.name.blank?
  	end
end
