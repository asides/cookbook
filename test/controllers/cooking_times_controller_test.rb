require 'test_helper'

class CookingTimesControllerTest < ActionController::TestCase
  setup do
    @cooking_time = cooking_times(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cooking_times)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cooking_time" do
    assert_difference('CookingTime.count') do
      post :create, cooking_time: { order: @cooking_time.order, title: @cooking_time.title }
    end

    assert_redirected_to cooking_time_path(assigns(:cooking_time))
  end

  test "should show cooking_time" do
    get :show, id: @cooking_time
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cooking_time
    assert_response :success
  end

  test "should update cooking_time" do
    patch :update, id: @cooking_time, cooking_time: { order: @cooking_time.order, title: @cooking_time.title }
    assert_redirected_to cooking_time_path(assigns(:cooking_time))
  end

  test "should destroy cooking_time" do
    assert_difference('CookingTime.count', -1) do
      delete :destroy, id: @cooking_time
    end

    assert_redirected_to cooking_times_path
  end
end
