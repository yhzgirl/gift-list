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

  test 'an unauthenticated user cannot create a session' do
    user = UserFactory.user
    post :create, { :email => 'notmy@email.com', :password => 'wrongpassword' }
    refute session[:user_id]
  end

  test 'that a session can be ended/destroyed' do
    user = UserFactory.user
    post :create, { :email => user.email, :password => user.password }
    assert_equal user.id, session[:user_id]
    delete :destroy, { :id => session[:user_id] }
    refute session[:user_id]
  end
end