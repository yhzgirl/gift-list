require 'test_helper'
require 'factories/list_factory'
require 'factories/user_factory'

class ListsControllerTest < ActionController::TestCase

  test "should get index if logged in" do
    user = UserFactory.user
    get :index, {}, { :user_id => user.id } # simulates typing localhost:3000/lists/1
    assert_response :success
    assert_not_nil assigns(:lists)
  end

  test 'cannot get index unless logged in' do
    assert session[:user_id].nil?
    get :index # simulates typing localhost:3000/lists
    assert_redirected_to new_session_path
  end

  test "a list of occasions can be created if logged in" do
    user = UserFactory.user
    assert_equal 0, List.count
    post :create, {:list => {:occasion => "Birthday"}}, {:user_id => user.id} # submitting a form to create a new list
    assert_equal 1, List.count
    assert_equal "Birthday", List.first.occasion
  end

  test 'a list of occasions cannot be created unless logged in' do
    assert_equal 0, List.count
    post :create, { :list => {:occasion => 'Birthday'} }
    assert_equal 0, List.count
  end

  test 'an occasion can be edited if logged in' do
    user = UserFactory.user
    list = ListFactory.list
    get :edit, {:id => list.id}, {:user_id => user.id}# simulates typing localhost:3000/lists/1/edit in the browser
    assert_response :success
    assert_equal list, assigns(:list) # assigns(:list) is what the controller assigns to @list
  end

  test 'an occasion can be updated if logged in' do
    user = UserFactory.user
    list = ListFactory.list
    assert_equal "some occasion", list.occasion
    put :update, { :list => { :occasion => "Graduation" }, :id => list.id }, {:user_id => user.id}
    assert_equal list, assigns(:list)
    assert_equal 'Graduation', assigns(:list).occasion
  end

  test 'cannot update an occasion unless logged in' do
    list = ListFactory.list
    assert_equal "some occasion", list.occasion
    put :update, {:list => {:occasion => "Christmas"}, :id => list.id}
    assert_equal 'some occasion', list.occasion
  end

  test 'an occasion can be deleted if logged in' do
    user = UserFactory.user
    list = ListFactory.list
    assert_equal 1, List.count
    delete :destroy, { :id => list.id }, {:user_id => user.id}
    assert_equal 0, List.count
  end

  test 'cannot delete occasion unless logged in' do
    list = ListFactory.list
    assert_equal 1, List.count
    delete :destroy, {:id => list.id }
    assert_equal 1, List.count
  end
end





