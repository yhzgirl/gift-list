# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  occasion   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class List < ActiveRecord::Base
  attr_accessible :occasion
end
