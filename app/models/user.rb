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
 
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_length_of :password, :on => :create, :minimum => 5, :message => "must be at least 5 characters long."
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid"

  def admin?
    admin
  end
end
