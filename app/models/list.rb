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

  belongs_to :user

  attr_accessible :occasion

  validates :occasion, :presence => :true
  validates_uniqueness_of :occasion

end