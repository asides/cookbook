# == Schema Information
#
# Table name: recipe_parts
#
#  id          :integer          not null, primary key
#  image       :string(255)
#  description :text
#  recipe_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class RecipePart < ActiveRecord::Base
  mount_uploader :image, RecipePartPhotoUploader

  belongs_to :recipe

end
