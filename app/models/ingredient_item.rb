# == Schema Information
#
# Table name: ingredient_items
#
#  id                 :integer          not null, primary key
#  qty                :decimal(, )
#  ingredient_id      :integer
#  measure_id         :integer
#  created_at         :datetime
#  updated_at         :datetime
#  ingredient_list_id :integer
#

class IngredientItem < ActiveRecord::Base
	before_save :prepare_ingredient

  belongs_to :ingredient_list
  belongs_to :ingredient
  belongs_to :measure
  
  accepts_nested_attributes_for :ingredient
  
  private
  	def prepare_ingredient
     	self.ingredient = Ingredient.where(name: self.ingredient.name).first_or_create
  	end
end
