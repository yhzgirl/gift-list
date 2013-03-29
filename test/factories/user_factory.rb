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

class UserFactory

  def self.user(params = {})
    params[:email] ||= "fake@email.com"
    params[:password] ||= "password"
    User.create!(params)
  end

  def self.admin_user(params = {})
    user = self.user(params)
    user.admin = true
    user.save!
    user
  end
end
