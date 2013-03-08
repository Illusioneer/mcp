require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
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

  test "should get report" do
    get :report
    assert_response :success
  end

  test "should get generate" do
    get :generate
    assert_response :success
  end

  test "should get nagios" do
    get :nagios
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

end
