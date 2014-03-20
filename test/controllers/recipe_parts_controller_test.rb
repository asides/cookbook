require 'test_helper'

class RecipePartsControllerTest < ActionController::TestCase
  setup do
    @recipe_part = recipe_parts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recipe_parts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recipe_part" do
    assert_difference('RecipePart.count') do
      post :create, recipe_part: { description: @recipe_part.description, image: @recipe_part.image, recipe_id: @recipe_part.recipe_id }
    end

    assert_redirected_to recipe_part_path(assigns(:recipe_part))
  end

  test "should show recipe_part" do
    get :show, id: @recipe_part
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recipe_part
    assert_response :success
  end

  test "should update recipe_part" do
    patch :update, id: @recipe_part, recipe_part: { description: @recipe_part.description, image: @recipe_part.image, recipe_id: @recipe_part.recipe_id }
    assert_redirected_to recipe_part_path(assigns(:recipe_part))
  end

  test "should destroy recipe_part" do
    assert_difference('RecipePart.count', -1) do
      delete :destroy, id: @recipe_part
    end

    assert_redirected_to recipe_parts_path
  end
end
