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

  # validates :occasion, :presence => { :message => 'Occasion cannot be blank!' }
  # validate_uniqueness_of :ocassion

end