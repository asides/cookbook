class RecipesCategory < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :category
end
