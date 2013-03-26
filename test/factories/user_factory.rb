class UserFactory

  def self.user(params = {})
    params[:email] ||= "fake@email.com"
    params[:password] ||= "password"
    User.create!(params)
  end
end