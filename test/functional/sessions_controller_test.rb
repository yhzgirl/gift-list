require 'test_helper'
require 'factories/user_factory'

class SessionsControllerTest < ActionController::TestCase
  
  test "should get new" do
    get :new
    assert_response :success
  end

  test 'a session can be created' do
    user = UserFactory.user
    post :create, { :email => user.email, :password => user.password }
    assert_equal user.id, session[:user_id]
  end

end
