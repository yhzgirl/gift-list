require 'test_helper'
require 'factories/user_factory'

class UsersControllerTest < ActionController::TestCase

  test 'user is not logged in redirects to log in page' do
    assert session[:user_id].nil?
    get :edit, {:id => UserFactory.user}
    assert_redirected_to new_session_path
  end

  test 'can get user index' do
    user = UserFactory.user
    get :index, {}, {:user_id => user.id}
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

  test 'when user is created they are also logged in' do
    post :create, {:user => {:email => "fake@email.com",
                             :password => 'password', :password_confirmation => 'password'}}
    assert_equal User.first.id, session[:user_id]
  end

  test 'can delete user if logged in' do
    user = UserFactory.user
    assert_equal 1, User.count
    delete :destroy, { :id => user.id }, { :user_id => user.id }
    assert_equal 0, User.count
  end

  test 'cannot delete user unless logged in' do
    user = UserFactory.user
    assert_equal 1, User.count
    delete :destroy, { :id => user.id }
    assert_redirected_to new_session_path
    assert_equal 1, User.count
  end

  test 'can edit user if logged in' do
    user = UserFactory.user
    get :edit, { :id => user.id }, { :user_id => user.id }
    assert_response :success
    assert_equal user, assigns(:user)
  end

  test 'can update a user if logged in' do
    user = UserFactory.user
    assert_equal "fake@email.com", user.email
    put :update, { :user => { :email => "betterfake@email.com" },
                   :id => user.id }, { :user_id => user.id }
    assert_equal user, assigns(:user)
    assert_equal "betterfake@email.com", assigns(:user).email
  end

  test 'cannot update a user unless logged in' do
    user = UserFactory.user
    assert_equal "fake@email.com", user.email
    put :update, { :user => { :email => "betterfake@email.com" }, :id => user.id }
    assert_redirected_to new_session_path
    assert_equal "fake@email.com", User.first.email
  end

  test 'if a user is admin and is logged in' do
    user = UserFactory.admin_user
    assert user.admin?
    session[:user_id] = user.id # simulates logging in current user
    assert @controller.send :current_user
    assert @controller.is_admin?
  end

  
end
