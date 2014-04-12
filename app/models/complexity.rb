# == Schema Information
#
# Table name: complexities
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  order      :integer
#  created_at :datetime
#  updated_at :datetime
#

class Complexity < ActiveRecord::Base
	has_many :recipes
	validates :title, presence: true,length: { minimum: 2 }
	validates :sort_order, uniqueness: true, format: { with: /\A[0-9]\Z/ }
end
