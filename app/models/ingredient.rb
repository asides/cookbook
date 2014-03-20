# == Schema Information
#
# Table name: ingredients
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

# require 'elasticsearch/model'

class Ingredient < ActiveRecord::Base
	# include Elasticsearch::Model
	# include Elasticsearch::Model::Callbacks

	has_many :ingredient_items #, :uniq => true
	has_many :ingredient_lists, through: :ingredient_items

	before_save :capname

	accepts_nested_attributes_for :ingredient_items, reject_if: :all_blank
	accepts_nested_attributes_for :ingredient_lists, reject_if: :all_blank
	# settings  index: { number_of_shards: 1 },
	# 					analysis: { 
							
	# 						analyzer: { 
	# 							my_analyzer: {
	# 								"type" => 'custom', 
	# 								"tokenizer" => "standard", 
	# 								"filter" => ["lowercase", "russian_morphology", "english_morphology"]
	# 							}
	# 						}	
	# 					} do
    
 #    mappings dynamic: 'false' do
 #      indexes :name, analyzer: 'my_analyzer', index_options: 'offsets'
 #    end
 #  end

  private 
  	def capname
  		self.name = self.name.mb_chars.capitalize
  		#self.name.downcase!
  		#self.id = Ingredient.where(name: self.name).first_or_create
  	end
end
