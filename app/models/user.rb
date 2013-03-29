# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  name            :string(255)
#

class User < ActiveRecord::Base

  has_secure_password

  has_many :lists

  attr_accessible :name, :email, :password, :password_confirmation

  validates_uniqueness_of :email

  def admin?
    admin
  end
end
