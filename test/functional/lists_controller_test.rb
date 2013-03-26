require 'test_helper'
require 'factories/list_factory'

class ListsControllerTest < ActionController::TestCase

  test "should get index" do
    get :index # simulates typing localhost:3000/lists
    assert_response :success
    assert_not_nil assigns(:lists)
  end

  test "a list of occasions can be created" do
    assert_equal 0, List.count
    post :create, {:list => {:occasion => "Birthday"}} # submitting a form to create a new list
    assert_equal 1, List.count
    assert_equal "Birthday", List.first.occasion
  end

  test 'an occasion can be edited' do
    list = ListFactory.list
    get :edit, {:id => list.id} # simulates typing localhost:3000/lists/1/edit in the browser
    assert_response :success
    assert_equal list, assigns(:list) # assigns(:list) is what the controller assigns to @list
  end

  test 'an occasion can be updated' do
    list = ListFactory.list
    assert_equal "some occasion", list.occasion
    put :update, {:list => {:occasion => "Graduation"}, :id => list.id }
    assert_equal list, assigns(:list)
    assert_equal 'Graduation', assigns(:list).occasion
  end

  test 'an occasion can be deleted' do
    list = ListFactory.list
    assert_equal 1, List.count
    delete :destroy, { :id => list.id }
    assert_equal 0, List.count
  end
end