# == Schema Information
#
# Table name: measures
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  val        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Measure < ActiveRecord::Base
end
