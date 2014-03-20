# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  parent_id  :integer
#  lft        :integer
#  rgt        :integer
#  depth      :integer
#

class Category < ActiveRecord::Base
	acts_as_nested_set
	include TheSortableTree::Scopes

	has_and_belongs_to_many :recipes
end
