require 'test_helper'

class JobsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get scranton" do
    get :scranton
    assert_response :success
  end

end
