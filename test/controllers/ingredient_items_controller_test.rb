require 'test_helper'

class IngredientItemsControllerTest < ActionController::TestCase
  setup do
    @ingredient_item = ingredient_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ingredient_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ingredient_item" do
    assert_difference('IngredientItem.count') do
      post :create, ingredient_item: { ingredient_id: @ingredient_item.ingredient_id, measure_id: @ingredient_item.measure_id, qty: @ingredient_item.qty }
    end

    assert_redirected_to ingredient_item_path(assigns(:ingredient_item))
  end

  test "should show ingredient_item" do
    get :show, id: @ingredient_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ingredient_item
    assert_response :success
  end

  test "should update ingredient_item" do
    patch :update, id: @ingredient_item, ingredient_item: { ingredient_id: @ingredient_item.ingredient_id, measure_id: @ingredient_item.measure_id, qty: @ingredient_item.qty }
    assert_redirected_to ingredient_item_path(assigns(:ingredient_item))
  end

  test "should destroy ingredient_item" do
    assert_difference('IngredientItem.count', -1) do
      delete :destroy, id: @ingredient_item
    end

    assert_redirected_to ingredient_items_path
  end
end
