class RecipesCategory < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :category

  validates :category_id, uniqueness: true

end
