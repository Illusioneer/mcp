require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "should get hostping" do
    get :hostping
    assert_response :success
  end

  test "should get serviceping" do
    get :serviceping
    assert_response :success
  end

  test "should get winjobs" do
    get :winjobs
    assert_response :success
  end

end
