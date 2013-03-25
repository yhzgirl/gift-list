require 'test_helper'
require 'factories/list_factory'

class ListsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lists)
  end

  test "a list of occasions can be created" do
    get :new
    assert_response :success
    list = ListFactory.list
    post :create
    assert_equal 1, List.count
  end

  # test 'an occasion can be updated' do
  #   get :edit
  #   assert_response :success
  #   List.find(params[:id])
  # end

end
