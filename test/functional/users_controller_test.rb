require 'test_helper'
require 'factories/list_factory'

class UsersControllerTest < ActionController::TestCase

  test 'can get user index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test 'can add new user' do
    get :new
    assert_response :success
    assert_not_nil assigns(:user)
  end

  test 'can create new user' do
    assert_equal 0, User.count
    post :create, {:user => {:email => "fake@email.com", 
      :password => 'password', :password_confirmation => 'password'}}
    assert_equal 1, User.count
    assert_equal 'fake@email.com', User.first.email
  end
end
