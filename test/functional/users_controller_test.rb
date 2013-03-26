require 'test_helper'
require 'factories/user_factory'

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

  test 'can delete user' do
    user = UserFactory.user
    assert_equal 1, User.count
    delete :destroy, { :id => user.id }
    assert_equal 0, User.count
  end

  test 'a user can be edited' do
    user = UserFactory.user
    get :edit, { :id => user.id }
    assert_response :success
    assert_equal user, assigns(:user)
  end

  test 'can a user be updated' do
    user = UserFactory.user
    assert_equal "fake@email.com", user.email
    put :update, { :user => { :email => "betterfake@email.com" }, :id => user.id }
    assert_equal user, assigns(:user)
    assert_equal "betterfake@email.com", assigns(:user).email
  end
end
