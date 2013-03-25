require 'test_helper'

class ListsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lists)
  end

  test "a list of occasions can be created" do
    get :new
    assert_response :success
    list = List.new(:occasion => "Birthday")
    post :create
    assert_equal 1, List.count
  end



end
